shared_examples_for Validatable do
  describe '#valid_phone' do
    subject(:employer) { create(:employer) }
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

describe Employer do
  it_behaves_like Validatable
end

describe Message do
  it_behaves_like Validatable
end
