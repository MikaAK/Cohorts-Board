class CohortsController < ApplicationController

  skip_before_action :authenticate, only: [:show] if @visitor

  def index
    @cohorts = Cohort.all
    render_layout
  end

  def show
    @cohort = Cohort.find params[:id]
    @students = @cohort.students
    render_layout
  end
end
