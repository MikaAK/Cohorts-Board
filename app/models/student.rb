class Student < ActiveRecord::Base
  belongs_to :cohort

  validates :first_name, :last_name, format: /[a-zA-Z]*?/
  validates :github_url, format: /\Ahttps:\/\/github.com\//
  validates :image_url, url: true
  validates :linked_url, format: /linkedin/
  validates :stackoverflow_url, format: /\Ahttp:\/\/stackoverflow.com\/users\//

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
