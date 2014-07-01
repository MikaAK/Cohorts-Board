class Employers::BaseController < ApplicationController
  
  before_action :authenticate_employer

  before_action :setup_inquiry

  layout 'employer'
  private

  def authenticate_employer
    redirect_to root_path, alert: "You don't have permissions for that area!" unless current_employer
  end

  def setup_inquiry
    @message = Message.new
  end

  def current_employer
    @employer ||= session[:employer_uuid] && Employer.find_by_uuid(session[:employer_uuid])
  end
end
