class Student < ActiveRecord::Base
  include User

  belongs_to :cohort

  validates :short_bio, length: { minimum: 25, maximum: 250 }, allow_blank: true
  validates :first_name, :last_name, format: /[a-zA-Z]*?/
  validates :image_url, url: true, allow_blank: true
  validates :email, email: true
  validates :cohort, presence: true

  # VALIDATIONS

  # Passed by handles auto concat to proper url

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def urls_to_a
    urls = [ "Linked In", linkedin_url,
             "Github", github_url,
             "Stackoverflow", stackoverflow_url ]

    urls.each_slice(2) do |slice|
      yield slice if slice[1]
    end
  end
end
