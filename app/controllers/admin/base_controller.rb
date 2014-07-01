class Admin::BaseController < ApplicationController
  
  http_basic_authenticate_with name: 'admin' , password: ENV['ADMIN_PASSWORD']

  skip_before_action :authenticate_user

  before_action :setup_creation

  layout 'admin'

  private

  def setup_creation
    @message = Message.new
    @student = Student.new
  end
end
