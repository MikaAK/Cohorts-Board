require 'rails_helper'

describe Message, :type => :model do
  describe 'validations' do
    it { validate_presence_of(:name) }
    it { validate_presence_of(:title) }
    it { validate_presence_of(:email) }
    it { validate_numericality_of(:cohort_id).is_greater_than 0 }
    it { should allow_value('').for(:cohort_id) }
  end

  describe '#initialize' do
    it 'sets values on new' do
      message = Message.new(name: 'Hello', email: 'me@bil.ca', title: "HELLO WORLD")
      expect(message.title).to eq 'HELLO WORLD'
      expect(message.name).to eq 'Hello'
      expect(message.email).to eq 'me@bil.ca'
    end
  end

  describe '#print_students' do
    it 'list students on new lines for every student' do
      message = Message.new(name: 'Hello', email: 'me@bil.ca', title: "HELLO WORLD", students: 'Mellow Game,Nail Tes,Abo Ula')
      expect(message.print_students).to eq "Students to interview: \nMellow Game\nNail Tes\nAbo Ula"
    end

    it 'lists no students if nothing given' do
      message = Message.new(name: 'Hello', email: 'me@bil.ca', title: "HELLO WORLD")
      expect(message.print_students).to eq "Students to interview: \n"
    end
  end
end
