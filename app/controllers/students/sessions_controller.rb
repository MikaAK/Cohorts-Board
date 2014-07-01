class Students::SessionsController < Students::BaseController

  skip_before_action :authenticate_student, :current_student

  def create
    @student = Student.authorize_key params[:uuid]

    if @student.present?
      session[:student_uuid] = @student.uuid
      @student.registered? ? redirect_to(students_profile_path) : redirect_to(edit_students_profile_path)
    else
      redirect_to :root, flash: { error: "Invalid access key please try again" }
    end
  end
end
