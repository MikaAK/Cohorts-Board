class Students::StudentController < Students::BaseController
  def create
    @student = Student.new student_params
    if @student.save(validate: false)
      @student = Student.where(student_params).take
      AdminMailer.new_student @student, request.env['HTTP_HOST']
      flash[:success] = "Student created successfully"
    else
      flash[:error] = "Student creation failed"
    end
    redirect_to :root
  end

  def update
    @student = Student.find params[:id]
    if @student.update(student_params)
      flash[:success] = "Changes saved successfully"
      redirect_to student_path params[:id]
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
