module Authenticatable
  extend ActiveSupport::Concern
  def owns_page?(id)
    (self.student?) &&
    (self.id == id.to_i)
  end
end
