class Student < ActiveRecord::Base
  belongs_to :cohort

  validates :short_bio, length: { minimum: 25, maximum: 250 }, allow_blank: true
  validates :first_name, :last_name, format: /[a-zA-Z]*?/
  validates :github_url, format: /\Ahttps:\/\/github.com\//, allow_blank: true
  validates :image_url, url: true, allow_blank: true
  validates :linkedin_url, format: /linkedin/, allow_blank: true
  validates :email, email: true
  # validates :stackoverflow_url, format: /\Ahttp:\/\/stackoverflow.com\/users\//

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

  def access_url(url)
    url + '/' + self.uuid
  end
end
