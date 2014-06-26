class StudentsController < ApplicationController
  def create
    @student = Student.new(student_params)
    if @student.save
      @student = Student.where(student_params).take
      AdminMailer.new_student(@student, request.env['HTTP_HOST'])
      flash[:success] = "Student created successfully"
    else
      flash[:error] = "Student creation failed"
    end
    redirect_to root_path
  end

  def show
    @student = Student.find params[:id]
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :email, :cohort_id)
  end
end
