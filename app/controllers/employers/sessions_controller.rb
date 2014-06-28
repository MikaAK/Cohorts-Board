class Employer::SessionsController < Employers::BaseController
  skip_before_action :authenticate_employer

  def create
    @employer = Employer.find_by_uuid(params[:uuid])
    session[:employer_uuid] = @employer.present? && @employer.uuid
    redirect_to employers_root_path
  end
end
