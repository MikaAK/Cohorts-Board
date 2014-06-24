class CohortsController < ApplicationController

  before_action :message

  def index
    @cohorts = Cohort.all
    # binding.pry
    render_layout
  end

  def message
    @message = Message.new
  end
end
