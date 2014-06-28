require 'pry'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :setup

  private

  def logged_in?
    user_uuid = find_by_uuid(session[:visitor])
    @user = user_uuid if user_uuid
  end

  def render_layout
    if @user.admin?
      render layout: 'admin'
    else
      render layout: 'application'
    end
  end

  def setup
    if @user.admin?
      @message = Message.new
      @student = Student.new
    elsif @user.employer?
      @message = Message.new
    end
  end
end
