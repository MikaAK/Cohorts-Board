class Employers::SessionController < Employers::BaseController
  skip_before_action :authenticate_employer

  def create
    session[:employer_uuid] = Employer.find_by_uuid(params[:uuid]).uuid
  end
end
