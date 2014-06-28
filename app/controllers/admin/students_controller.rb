class Admin::StudentsController < Admin::BaseController
  def show
    @student = Student.find params[:id]
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
    redirect_to :root
  end
end
