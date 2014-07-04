shared_examples_for Authenticatable do
  describe '#authorize_key' do
    it 'returns valid instance given correct uuid' do
      student = create(:student)
      student = student.reload
      expect(Student.authorize_key(student.uuid)).to eq student
    end

    it 'returns nil for invalid uuid' do
      expect(described_class.authorize_key('apples')).to be_nil
    end
  end
end

describe Employer do
  it_behaves_like Authenticatable
end

describe Student do
  it_behaves_like Authenticatable
end
