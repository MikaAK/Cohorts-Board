class Message
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  attr_accessor :content, :name, :email, :title, :cohort_id, :phone_number, :students

  validates :email,
    email: true

  validates :cohort_id,
    numericality: { greater_than: 0, less_than_or_equal_to: Cohort.last.id },
    allow_blank: true

  validates :name, :email, :title,
    presence: true

  validate :valid_phone

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def print_students
    final_string = "Students to interview: \n"

    students = self.students.split(',')
    students.each do |student|
      final_string << "#{student}\n"
    end
    final_string
  end

  def valid_phone
    if self.phone_number
      number = self.phone_number.gsub /\D/, ''
      errors.add(:invalid_phone, "Phone number must contain 9 digets") unless number =~ /\d{9,10}/
    end
  end
end
