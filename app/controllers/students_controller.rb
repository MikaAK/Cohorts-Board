class StudentsController < ApplicationController
  def show
    @student = Student.find params[:id]
    render_layout
  end
end
