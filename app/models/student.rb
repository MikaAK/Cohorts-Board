class Student < ActiveRecord::Base
  include User
  belongs_to :cohort

  validates :short_bio, length: { minimum: 25, maximum: 250 }, allow_blank: true
  validates :first_name, :last_name, format: /[a-zA-Z]*?/
  validates :image_url, url: true, allow_blank: true # Going to be deleted
  validates :email, email: true, allow_blank: true
  validates :cohort, presence: true
  validates :personal_website_url, url: true, allow_blank: true

  before_update :append_urls

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def urls_to_a
    urls = [ "Linked In", linkedin,
             "Github", github]

    urls.each_slice(2) do |slice|
      yield slice if slice[1]
    end
  end

  def github_handle
    self.github[/(?<=.com\/).*/] if self.github
  end

  def linkedin_handle
    self.linkedin[/(?<=\/in\/).*/] if self.linkedin
  end

  def append_urls
    github.prepend('https://github.com/') unless is_url?(github)
    linkedin.prepend('https://www.linkedin.com/in/') unless is_url?(linkedin)
  end

  def is_url?(url)
    !!(url =~ /^https?:\/\//)
  end
end
