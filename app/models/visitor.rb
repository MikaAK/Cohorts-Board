class Visitor < ActiveRecord::Base

  def admin?
    admin = Visitor.where(uuid: ENV['ADMIN_UUID'])
    self == admin
  end
end
