require 'pry'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate

  private

  def authenticate
    if !@visitor || !params[:uuid]
      authenticate_or_request_with_http_basic do |login, password|
        @visitor = Visitor.find_by_uuid(ENV['ADMIN_UUID']) if login == 'test' &&  password == 'testpw'
      end
      session[:visitor] = @visitor
    elsif params[:uuid]
      @visitor = Visitor.where uuid: params[:uuid]
    end
  end

  def check_visitor
    params[:uuid] == @visitor.uuid
  end

  def render_layout
    if @visitor.admin?
      render layout: 'admin'
    else
      render layout: 'application'
    end
  end

  def self.valid_uuid?
    binding.pry
    !!(Visitor.where(uuid: params[:uuid]))
  end
end
