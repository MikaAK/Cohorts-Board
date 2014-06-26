class CohortsController < ApplicationController

  def index
    @cohorts = Cohort.all
    render_layout
  end
end
