class Message
  include ActiveModel::Validations
  include ActiveModel::Conversion
  include Validatable
  extend ActiveModel::Naming

  attr_accessor :content, :name, :email, :title, :cohort_id, :phone_number, :students

  validates :email,
    email: true

  validates :cohort_id,
    numericality: { greater_than: 0 },
    allow_blank: true

  validates :name, :email, :title,
    presence: true

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

    if self.students.present?
      final_string << self.students.split(',').join("\n")
    end

    final_string
  end
end
