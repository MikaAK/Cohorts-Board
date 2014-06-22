require 'pry'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate

  private

  def authenticate
    if !@visitor.uuid
      authenticate_or_request_with_http_basic do |login, password|
        @visitor = "Admin" if login == 'test' &&  password == 'testpw'
      end
    end
  end

  def check_visitor
    params[:uuid] == @visitor.uuid
  end
end
