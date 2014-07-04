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
      subject(:student) { create(:student) }

      it "doesn't allow faulty email" do
        student.email = "Imabignoob@testy .   facebook    ,a"
        expect(student).to_not be_valid
      end

      it 'allows real emails' do
        expect(student).to be_valid
      end
    end

    describe 'validates personal website' do
      subject(:student) { create(:student) }

      it "doesn't allow non urls" do
        student.personal_website_url = "applejak"
        expect(student).to_not be_valid
      end

      it 'allows urls' do
        student.personal_website_url = "http://www.google.ca"
        expect(student).to be_valid
      end
    end
  end

  describe 'scopes' do
    subject(:student) { create(:student) }

    context 'registered' do
      it 'returns registered students' do
        student.update_attribute(:registered, true)
        expect(Student.registered).to include(student)
      end
    end

    context 'unregistered' do
      it 'returns unregistered students' do
        expect(Student.unregistered).to include(student)
      end
    end
  end

  describe '#full_name' do
    subject(:student) { create(:student) }

    it 'puts together first_name & lastname' do
      fullname = "#{student.first_name} #{student.last_name}"
      expect(student.full_name).to eq fullname
    end

    it 'gives first name if no last name' do
      student.last_name = ''
      expect(student.full_name).to eq student.first_name
    end
  end

  describe "uploaders" do
    context 'avatar' do
      it 'uploads valid images'

      it 'does not upload invalid extensions'
    end

    context 'resume' do
      it 'uploads valid pdfs'

      it 'does not upload non-pdfs'
    end
  end
end
