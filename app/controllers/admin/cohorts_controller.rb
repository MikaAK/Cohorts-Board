class Admin::CohortsController < Admin::BaseController
  def index
    @cohorts = Cohorts.all
  end
end
