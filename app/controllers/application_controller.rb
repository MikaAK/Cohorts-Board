require 'pry'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate, unless: :logged_in?
  before_action :setup, if: :admin?

  def setup
    @message = Message.new
    @student = Student.new
  end

  private

  def logged_in?
    user_uuid = find_by_uuid(session[:visitor])
    @visitor = user_uuid if user_uuid
  end

  def authenticate
    uuid = params[:uuid]
    @visitor ||= find_by_uuid(uuid)

    if !@visitor
      authenticate_or_request_with_http_basic do |login, password|
        @visitor = Admin.where(user_name: login).take if login == 'test' &&  password == 'testpw'
      end
      session[:visitor] = @visitor && @visitor.uuid
    else
      session[:visitor] = @visitor && @visitor.uuid
    end
  end

  def find_by_uuid(uuid)
    uuid && (Admin.find_by_uuid(uuid) || Visitor.find_by_uuid(uuid) || Student.find_by_uuid(uuid))
  end

  def render_layout
    if @visitor.admin?
      render layout: 'admin'
    else
      render layout: 'application'
    end
  end

  def admin?
    @visitor.admin?
  end
end
