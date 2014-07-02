class Student::ProfilesController < Student::BaseController

  def edit
  end

  def show
  end

  def update
    @student.registered = true
    if @student.update(student_params)
      redirect_to edit_student_profile_path, success: "Changes saved successfully"
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
