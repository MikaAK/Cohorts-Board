module User
  def admin?
    self.is_a?(Admin)
  end

  def student?
    self.is_a?(Student)    
  end

  def access_url(url)
    url + '/' + self.uuid
  end
end
