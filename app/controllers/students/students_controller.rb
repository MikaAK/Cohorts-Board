class Students::StudentsController < Students::BaseController
  def show
    @student = Student.find_by_uuid session[:student_uuid]
  end

  def update
    @student = Student.find params[:id]
    if @student.update(student_params)
      flash[:success] = "Changes saved successfully"
      redirect_to admin_student_path params[:id]
    else
      flash[:error] = "Changes not saved"
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
