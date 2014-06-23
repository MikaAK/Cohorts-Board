class CohortsController < ApplicationController

  before_action :message
  before_action :redirect, unless: :admin

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
