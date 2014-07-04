class Employer < ActiveRecord::Base
  include Authenticatable
  include Validatable

  validates :email,
    email: true

  validates :first_name,
    :email, presence: true
end
