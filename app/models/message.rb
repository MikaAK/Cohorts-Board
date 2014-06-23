class Message
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  attr_accessor :content, :name, :email, :title, :cohort_id, :phone_number

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
end
