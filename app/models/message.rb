class Message
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  attr_accessor :content, :name, :email, :title, :cohort_id, :phone_number, :students

  validates :email, email: true
  validates :cohort_id, numericality: { greater_than: 0, less_than_or_equal_to: Cohort.last.id }
  validates :cohort_id, :name, :email, :title, presence: true




  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def print_students
    cohort = Cohort.find_by_id(self.cohort_id).start_date.strftime "%B"
    final_string = "#{cohort} students to interview: \n"

    students = self.students.split(',')
    students.each do |student|
      final_string << "#{student}\n"
    end
    final_string
  end
end
