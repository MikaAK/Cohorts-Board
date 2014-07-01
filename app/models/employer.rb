class Employer < ActiveRecord::Base
  include Authenticatable

  validate :valid_phone
  
  validates :email,
    email: true

  validates :first_name,
    :email, presence: true

  def valid_phone
    if self.phone_number
      number = self.phone_number.gsub /\D/, ''
      errors.add(:invalid_phone, "Phone number must contain 9 digets") unless number =~ /\d{9,10}/
    end
  end
end
