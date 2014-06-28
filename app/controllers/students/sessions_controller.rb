class Students::SessionsController < Students::BaseController
  skip_before_action :authenticate_student

  def create
    begin
      @student = Student.find_by_uuid(params[:uuid])
    rescue ActiveRecord::StatementInvalid
    end
    if @student.present?
      session[:student_uuid] = @student.uuid
      redirect_to student_path(@student.id)
    else
      redirect_to root_path, alert: "Invalid UUID please try again"
    end
  end
end
