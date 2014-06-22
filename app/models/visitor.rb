class Visitor < ActiveRecord::Base

  def admin?
    self.uuid == ENV['ADMIN_UUID']
  end
  
end
