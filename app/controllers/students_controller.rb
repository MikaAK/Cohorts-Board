class StudentsController < ApplicationController
  def home
    @students = Student.find params[:cohort_id]
  end
  
  def new
    @student = Student.new
  end

  def create
    if @student.save!
      render 'index'
    else
      flash.now[:notice] = "Failed"
      render 'index'
    end
  end
end
