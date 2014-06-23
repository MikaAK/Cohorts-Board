class VisitorsController < ApplicationController
  def new
    @message = Message.new
  end
end
