class Student::SessionController < Student::BaseController
  skip_before_action :authenticate_student

  def create
    session[:student_uuid] = Student.find_by_uuid(params[:uuid]).uuid
  end
end
