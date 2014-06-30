class Students::StudentsController < Students::BaseController

  def show
    @student = Student.find_by_uuid session[:student_uuid]
  end

  def update
    @student = Student.find_by_uuid session[:student_uuid]
    @student.registered = true
    if @student.update(student_params)
      flash[:success] = "Changes saved successfully"
      redirect_to students_profile_path
    else
      flash.now[:error] = "Changes not saved, check your form and try again"
      render :show
    end
  end

  private

  def student_params
    params.require(:student)
      .permit(:first_name, :email, :resume,
              :cohort_id, :last_name,
              :bio, :short_bio, :github,
              :linkedin, :email, :avatar,
              :cities_to_work, :city_from,
              :developer_role, :personal_website_url)
  end
end
