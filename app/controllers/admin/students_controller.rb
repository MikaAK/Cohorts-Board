class Admin::StudentsController < Admin::BaseController
  def show
    @student = Student.find params[:id]
  end
end
