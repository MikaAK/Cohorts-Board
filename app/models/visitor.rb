class Visitor < ActiveRecord::Base
  belongs_to :cohort

  validates :phone_number, format: /\Z(?:(?:\(?(?:00|\+)([1-4]\d\d|[1-9]\d?)\)?)?[\-\.\ \\\/]?)?((?:\(?\d{1,}\)?[\-\.\ \\\/]?){0,})(?:[\-\.\ \\\/]?(?:#|ext\.?|extension|x)[\-\.\ \\\/]?(\d+))?\z/i
  validates :email, email: true

  def admin?
    self.uuid == ENV['ADMIN_UUID']
  end
end
