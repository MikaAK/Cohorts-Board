class Visitor < ActiveRecord::Base
  belongs_to :cohort

  validates :phone_number, format: /\A(?:(?:\(?(?:00|\+)([1-4]\d\d|[1-9]\d?)\)?)?[\-\.\ \\\/]?)?((?:\(?\d{1,}\)?[\-\.\ \\\/]?){0,})(?:[\-\.\ \\\/]?(?:#|ext\.?|extension|x)[\-\.\ \\\/]?(\d+))?\z/i
  validates :email, email: true
  validates :github_url, format: /\Ahttps:\/\/github.com\//

  validates :linked_url, format: /linkedin/
  validates :stackoverflow_url, format: /\Ahttp:\/\/stackoverflow.com\/users\//

  def admin?
    self.uuid == ENV['ADMIN_UUID']
  end

  def url(url)
    url + '/cohorts/' + self.cohort_id.to_s + '/uuid=' + self.uuid
  end
end
