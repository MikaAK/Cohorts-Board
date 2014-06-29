class Students::SessionsController < Students::BaseController
  skip_before_action :authenticate_student

  def create
    begin
      @student = Student.find_by_uuid(params[:uuid])
    rescue ActiveRecord::StatementInvalid
    end

    if @student.present?
      session[:student_uuid] = @student.uuid
      @student.registered? ? redirect_to(root_path) : redirect_to(students_profile_path)
    else
      redirect_to root_path, alert: "Invalid UUID please try again"
    end
  end
end