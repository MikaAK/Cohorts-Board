class Student < ActiveRecord::Base
  include Authenticatable
  belongs_to :cohort

  mount_uploader :avatar, StudentAvatarUploader
  mount_uploader :resume, StudentResumeUploader

  validates :first_name, length: { minimum: 0, maxiumum: 50 }
  validates :last_name, length: { minimum: 0, maxiumum: 50 }, if: :registered?
  validates :email, email: true, allow_blank: true
  validates :short_bio, length: { minimum: 25, maximum: 250 }, allow_blank: true, if: :registered?
  validates :cohort, presence: true, if: :is_registered?
  validates :personal_website_url, url: true, allow_blank: true, if: :registered?

  before_update :append_urls
  before_create :set_not_registered

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def set_not_registered
    self.registered = false
    true
  end
end
