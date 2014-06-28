class Employer::BaseController < ApplicationController
  before_action :authenticate_employer

  private

  def authenticate_employer
    redirect_to root_path, alert: "You don't have permissions for that area!"
  end

  def current_employer
    @student ||= session[:employer_uuid] & Employer.find_by_uuid(session[:employr_uuid])
  end
end
