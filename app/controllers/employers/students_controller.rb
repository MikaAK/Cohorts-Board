class Employers::StudentsController < Employers::BaseController
  def show
    @student = Student.find params[:id]
  end
end
