class Admin::CohortsController < Admin::BaseController

  def new
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.new cohort_params

    if @cohort.save
      redirect_to new_admin_cohort_path, flash: { success: 'Cohort created successfully' }
    else
      flash.now[:error] = "Cohort failed to create"
      render :new
    end
  end

  def index
    @cohorts = Cohort.all
  end

  private

  def cohort_params
    params.require(:cohort).permit(:start_date, :end_date)
  end
end
