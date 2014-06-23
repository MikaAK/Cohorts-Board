class VisitorsController < ApplicationController
  def new
    binding.pry
    @message = Message.new(message_params[0])
    if @message.valid?
      flash[:success] = "Message sent successfully"
      redirect_to cohort_path(params[:cohort_id])
    else
      flash[:error] = "Message send unsuccessfull"
      redirect_to cohort_path(params[:cohort_id])
    end
  end

  def message_params
    [cohort_id: params[:cohort_id][:id], name: params[:name], email: params[:email], content: params[:message][:content], title: params[:message][:title]]
  end
end
