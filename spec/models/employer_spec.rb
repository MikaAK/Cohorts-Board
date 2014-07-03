require 'rails_helper'

describe Employer, :type => :model do
  describe 'validtations' do
    subject(:employer) { Employer.create first_name: 'Test', email: 'Testemail@gas.ca' }

    describe '#valid_phone' do
      it 'exists' do
        expect(employer).to respond_to :valid_phone
      end

      it 'returns error with invalid phonenumber' do
        expect(employer).to receive(:phone_number).and_return('778-712-1231142')
        employer.valid_phone
        expect(employer).to_not be_valid
      end

      it 'returns nil with valid phonenumber' do
        expect(employer).to receive(:phone_number).and_return('778-712-1232')
        employer.valid_phone
        expect(employer).to be_valid
      end
    end
  end
end
