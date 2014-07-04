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
  end
end
