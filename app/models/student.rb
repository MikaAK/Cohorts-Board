class Student < ActiveRecord::Base
  include Authenticatable

  belongs_to :cohort

  mount_uploader :avatar, StudentAvatarUploader
  mount_uploader :resume, StudentResumeUploader

  validates :first_name,
    length: { minimum: 0, maxiumum: 50 }

  validates :cohort,
    presence: true

  validates :email,
    email: true

  validates :short_bio,
    length: { minimum: 25, maximum: 250 },
    allow_blank: true, if: :registered?

  validates :last_name,
    length: { minimum: 0, maxiumum: 50 }, if: :registered?

  validates :personal_website_url,
    url: true, allow_blank: true, if: :registered?


  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
