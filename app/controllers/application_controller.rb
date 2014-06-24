require 'pry'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate, unless: :logged_in?

  private

  def logged_in?
    !!(session[:visitor] && @visitor = (Admin.find(session[:visitor]) || Visitor.find(session[:visitor])))
  end

  def authenticate
    uuid = params[:uuid]
    @visitor ||= uuid && Visitor.find_by_uuid(uuid)
    if !@visitor
      authenticate_or_request_with_http_basic do |login, password|
        binding.pry
        @visitor = Admin.where(user_name: login).take if login == 'test' &&  password == 'testpw'
      end
      session[:visitor] = @visitor && @visitor.id
    else
      session[:visitor] = @visitor && @visitor.id
    end
  end

  def render_layout
    if admin?
      render layout: 'admin'
    else
      render layout: 'application'
    end
  end

  def admin?
    @visitor.is_a?(Admin)
  end
end
