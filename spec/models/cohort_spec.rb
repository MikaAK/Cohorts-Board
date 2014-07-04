require 'rails_helper'

describe Cohort, :type => :model do
  describe '#within_range?' do
    it 'exists' do
      cohort = build(:cohort)
      expect(cohort).to respond_to :within_range?
    end

    it 'returns false past 3 months' do
      cohort = build(:cohort, start_date: 6.months.ago, end_date: 3.month.ago)
      expect(cohort.within_range?).to eq false
    end

    it 'returns true if within 3 months' do
      cohort = build(:cohort, start_date: 2.months.ago, end_date: 1.month.ago)
      expect(cohort.within_range?).to eq true
    end
  end

  describe '#registered_students?' do
    subject(:cohort) { create(:cohort) }
    it 'exists' do
      expect(cohort).to respond_to :registered_students?
    end

    it 'returns true if any registered students' do
      cohort.students << build(:basic_student)
      cohort.students.first.update_attribute(:registered, true)
      expect(cohort.registered_students?).to eq true
    end

    it 'returns false if no registered students' do
      expect(cohort.registered_students?).to eq false
    end
  end

  describe '#students' do
    subject(:cohort) { create(:cohort) }

    it 'has many students' do
      should have_many(:students)
    end

    it 'should destroy students when cohort is destroyed' do
      cohort.students << build(:basic_student)
      cohort.destroy
      expect(cohort.students).to be_empty
    end
  end
end
