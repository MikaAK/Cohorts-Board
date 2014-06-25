class StudentsController < ApplicationController
  def create
    @student = Student.new(student_params)

    if @student.save

    else

    end
  end

  def student_params
    params.require(:student).permit(:first_name, :email)
  end
end
