class Student < ActiveRecord::Base
  belongs_to :cohort

  validates :first_name, :last_name, format: /[a-zA-Z]*?/

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
