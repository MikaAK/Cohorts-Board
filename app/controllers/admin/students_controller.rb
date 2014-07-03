class Admin::StudentsController < Admin::BaseController

  before_action :current_student, except: :create

  def show
  end

  def edit
  end

  def create
    @student = Student.new student_params
    if @student.save
      @student.reload
      AdminMailer.new_student @student, request.env['HTTP_HOST']
      flash[:success] = "Student created successfully"
    else
      flash[:error] = "Student creation failed"
    end
    redirect_to admin_root_path
  end

  def update
    if @student.update(student_params)
      redirect_to admin_student_path(params[:id]), success: "Changes saved successfully"
    else
      flash.now[:error] = "Changes not saved"
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

  def current_student
    @student = Student.find params[:id]
  end
end
