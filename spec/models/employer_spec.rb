require 'rails_helper'

describe Employer, :type => :model do
  describe 'validtations' do
    subject(:employer) { create(:employer) }

    it 'validates email' do
      employer.email = 'this is a a garbage email'
      expect(employer).to_not be_valid
    end

    it { should validate_presence_of(:email) }

    it { should validate_presence_of(:first_name) }


    describe '#valid_phone' do
      it 'exists' do
        expect(employer).to respond_to :valid_phone
      end

      it 'returns error with invalid phonenumber' do
        employer.phone_number = '23192131223312'
        expect(employer).to_not be_valid
      end

      it "dosn't allow none number" do
        employer.phone_number = 'asdfasdfa'
        expect(employer).to_not be_valid
      end

      it 'returns nil with valid phonenumber' do
        employer.phone_number = '6042222567'
        expect(employer).to be_valid
      end
    end
  end
end
