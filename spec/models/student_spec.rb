require 'rails_helper'

describe Student, :type => :model do
  describe "association" do
    it { should belong_to(:cohort) }
  end

  describe 'validations' do
    it { validate_presence_of(:cohort) }
    it { ensure_length_of(:short_bio).is_at_least(25).is_at_most(250) }
    it { should allow_value('').for(:short_bio) }
    it { ensure_length_of(:first_name).is_at_least(0).is_at_most(50) }
    it { ensure_length_of(:last_name).is_at_least(0).is_at_most(50) }

    describe 'validates email' do
      it "doesn't allow faulty email" do
        student = create(:test_student)

        student.email = "Imabignoob@testy .   facebook    ,a"
        expect(student).to_not be_valid
      end

      it 'allows real emails' do
        student = create(:test_student)
        expect(student).to be_valid
      end
    end

    describe 'validates personal website' do
      it "doesn't allow non urls" do
        student = create(:test_student)
        student.personal_website_url = "applejak"
        expect(student).to_not be_valid
      end

      it 'allows urls' do
        student = create(:test_student)
        student.personal_website_url = "http://www.google.ca"
        expect(student).to be_valid
      end
    end
  end

  describe 'scopes' do
    context 'registered' do
      it 'returns registered students' do
        student = create(:test_student)
        student.update_attribute(:registered, true)
        expect(Student.registered).to include(student)
      end
    end

    context 'unregistered' do
      it 'returns unregistered students' do
        student = create(:test_student)
        expect(Student.unregistered).to include(student)
      end
    end
  end
end
