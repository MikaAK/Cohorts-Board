require 'rails_helper'

describe Cohort, :type => :model do
  describe '#within_range?' do
    it 'exists' do
      cohort = Cohort.create
      expect(cohort).to respond_to :within_range?
    end

    it 'returns false past 3 months' do
      cohort = Cohort.create(start_date: 'Febuary 2 2014', end_date: 'April 1 2014')
      expect(cohort.within_range?).to eq false
    end

    it 'returns true if within 3 months' do
      cohort = Cohort.create(start_date: 'April 1 2014', end_date: "June 2 2014")
      expect(cohort.within_range?).to eq true
    end
  end

  describe '#registered_students?' do
    subject(:cohort) { Cohort.create }
    it 'exists' do
      expect(cohort).to respond_to :registered_students?
    end

    it 'returns true if any registered students' do
      s = create(:student)
      s.update(registered: true)
      expect(cohort.registered_students?).to eq true
    end

    it 'returns false if no registered students' do
      expect(cohort.registered_students?).to eq false
    end
  end

  describe '#students' do
    subject(:cohort) { Cohort.create(start_date: '06-11-2014', end_date: '08-11-2014') }

    before :each do
      create(:student)
    end

    it 'can access students' do
      expect(cohort.students.size).to eq 1
    end
  end
end
