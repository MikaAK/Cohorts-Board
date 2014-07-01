class Students::StudentsController < Students::BaseController
  before_action :current_student
  
  def show
  end

  def edit
  end

  def update
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
