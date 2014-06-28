module Authenticatable
  def admin?
    self.is_a?(Admin)
  end

  def student?
    self.is_a?(Student)
  end

  def visitor?
    self.is_a?(Visitor)
  end

  def access_url(url)
    url + '/' + self.uuid
  end

  def owns_page?(id)
    return true if self.admin?
    (self.student?) &&
    (self.id == id.to_i)
  end
end
