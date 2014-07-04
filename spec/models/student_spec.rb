require 'rails_helper'
require 'carrierwave/test/matchers'


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
      subject(:student) { build(:student) }

      it "doesn't allow faulty email" do
        student.email = "Imabignoob@testy .   facebook    ,a"
        expect(student).to_not be_valid
      end

      it 'allows real emails' do
        expect(student).to be_valid
      end
    end

    describe 'validates personal website' do
      subject(:student) { build(:student) }

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
    subject(:student) { build(:student) }

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
    include CarrierWave::Test::Matchers
    subject(:student) { build(:test_student) }

    context 'avatar' do
      before do
        StudentAvatarUploader.enable_processing = true
        @uploader = StudentAvatarUploader.new student, :avatar
        @uploader.store!(File.open("#{Rails.root}/public/student_files/old_clock.jpg"))
      end

      after do
        StudentAvatarUploader.enable_processing = false
        @uploader.remove!
      end

      it 'should have thumb version (195,195)' do
        expect(@uploader.thumb).to be_no_larger_than(195, 195)
      end

      it 'should have normal version (300,300)' do
        expect(@uploader).to be_no_larger_than(300, 300)
      end
    end

    context 'resume' do
      it 'saves file to root' do
        StudentResumeUploader.enable_processing = true
        uploader = StudentResumeUploader.new student, :avatar
        uploader.store!(File.open("#{Rails.root}/public/student_files/resume.pdf"))
        expect(uploader.file.original_filename).to eq 'resume.pdf'
      end
    end
  end
end
