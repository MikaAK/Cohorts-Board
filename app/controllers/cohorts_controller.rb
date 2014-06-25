class CohortsController < ApplicationController

  before_action :setup

  def index
    @cohorts = Cohort.all
    render_layout
  end

  def setup
    @message = Message.new
    @student = Student.new
  end
end
