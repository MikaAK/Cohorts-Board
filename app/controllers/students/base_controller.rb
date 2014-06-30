class Students::BaseController < ApplicationController

  before_action :authenticate_student, unless: :current_student
  before_action :redirect

  private

  def authenticate_student
    redirect_to root_path, flash: { error: "You don't have permissions for that area!" }
  end

  def current_student
    @student ||= session[:student_uuid] && Student.find_by_uuid(session[:student_uuid])
  end

  def redirect

  end
end
