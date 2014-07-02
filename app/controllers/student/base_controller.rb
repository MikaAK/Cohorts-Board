class Student::BaseController < ApplicationController

  before_action :authenticate_student
  before_action :current_student

  private

  def authenticate_student
    redirect_to root_path, alert: "You don't have permissions for that area!" unless current_student
  end

  def current_student
    @student ||= session[:student_uuid] && Student.find_by(uuid: session[:student_uuid])
  end
end
