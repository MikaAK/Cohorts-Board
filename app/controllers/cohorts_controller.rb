class CohortsController < ApplicationController

  def index
    @cohorts = Cohort.all
    render_layout
  end

  def show
    @cohort = Cohort.find params[:id]
    @students = @cohort.students
    @message = Message.new
    render_layout
  end
end
