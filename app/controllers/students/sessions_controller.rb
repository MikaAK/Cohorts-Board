class Students::SessionsController < Students::BaseController
  skip_before_action :authenticate_student

  def create
    @student = Student.find_by_uuid(params[:uuid])
    session[:student_uuid] = @student.present? && @student.uuid
    redirect_to students_root_path
  end
end
