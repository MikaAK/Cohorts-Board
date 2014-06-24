class CohortsController < ApplicationController

  before_action :message

  def index
    @cohorts = Cohort.all
    render_layout
  end

  def show
    @cohort = Cohort.find params[:id]
    @students = @cohort.students
    render_layout
  end

  def message
    @message = Message.new
  end
end
