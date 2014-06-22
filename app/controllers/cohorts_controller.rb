class CohortsController < ApplicationController

  def index
    redirect_to show, status: 'Access Forbidden' unless @visitor.admin?
    @cohorts = Cohort.all
    render_layout
  end

  def show
    origin_url unless @visitor.admin?
    id = @pid || params[:id]
    binding.pry
    @cohort = Cohort.find id
    @students = @cohort.students
    render_layout
  end

  def origin_url
    @pid = @pid || params[:id]
  end
end
