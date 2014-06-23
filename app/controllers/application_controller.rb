require 'pry'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate, unless: :logged_in?
  before_action :redirect, unless: :admin

  def logged_in?
    !!(session[:visitor] && @visitor = Visitor.find(session[:visitor]))
  end

  private

  def authenticate
    uuid = params[:uuid]
    @visitor ||= uuid && Visitor.find_by_uuid(uuid)
    if !@visitor
      authenticate_or_request_with_http_basic do |login, password|
        @visitor = Visitor.find_by_uuid(ENV['ADMIN_UUID']) if login == 'test' &&  password == 'testpw'
      end
      session[:visitor] = @visitor && @visitor.id
    else
      session[:visitor] = @visitor && @visitor.id
    end
  end

  def render_layout
    if Visitor.find(session[:visitor]).admin?
      render layout: 'admin'
    else
      render layout: 'application'
    end
  end

  def admin
    @visitor.admin?
  end

  def redirect
    cohort_id = @visitor.cohort.id
    redirect_to cohort_path(cohort_id) unless params[:id].to_i == cohort_id
  end
end
