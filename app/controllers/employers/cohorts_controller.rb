class Employers::CohortsController < Employers::BaseController
  def index
    @cohorts = Cohort.all
  end
end
