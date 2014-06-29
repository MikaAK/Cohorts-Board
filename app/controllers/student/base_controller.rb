class Student::BaseController < ApplicationController

  before_action :authenticate_student, unless: :current_student

  private

  def authenticate_student
    redirect_to root_path, alert: "You don't have permissions for that area!"
  end

  def current_student
    @student ||= session[:student_uuid] & Student.find_by_uuid(session[:student_uuid])
  end
end
