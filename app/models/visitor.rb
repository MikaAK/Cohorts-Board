class Visitor < ActiveRecord::Base

  def create_uuid
    self.uuid = SecureRandom.uuid
  end  
end
