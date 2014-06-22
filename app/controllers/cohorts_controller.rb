class CohortsController < ApplicationController
  skip_before_action :authenticate, only: [:show]
  def index
    @cohorts = Cohort.all
  end

  def show
    @cohort = Cohort.find params[:id]
    @students = @cohort.students
  end
end
