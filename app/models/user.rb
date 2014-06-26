module User
  def admin?
    false
  end

  def access_url(url)
    url + '/' + self.uuid
  end
end
