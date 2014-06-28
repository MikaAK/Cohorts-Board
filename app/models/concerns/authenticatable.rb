module Authenticatable
  extend ActiveSupport::Concern
  def access_url(url)
    url + '/' + self.uuid
  end

  def owns_page?(id)
    (self.student?) &&
    (self.id == id.to_i)
  end
end
