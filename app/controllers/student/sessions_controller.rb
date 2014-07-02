class Student::SessionsController < Student::BaseController

  skip_before_action :authenticate_student, :current_student

  def create
    @student = Student.authorize_key params[:uuid]

    if @student.present?
      session[:student_uuid] = @student.uuid
      @student.registered? ? redirect_to(student_profile_path) : redirect_to(edit_student_profile_path)
    else
      redirect_to :root, flash: { error: "Invalid access key please try again" }
    end
  end
end
