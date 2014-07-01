class Employers::SessionsController < Employers::BaseController

  skip_before_action :authenticate_employer

  def create
    @employer = Employer.authorize_key params[:uuid]

    if @employer.present?
      session[:employer_uuid] = @employer.uuid
      redirect_to employers_root_path
    else
      redirect_to :root, flash: { error: 'Invalid access key please try again' }
    end
  end
end
