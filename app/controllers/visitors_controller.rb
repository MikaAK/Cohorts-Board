class VisitorsController < ApplicationController
  def new
    @message = Message.new(message_params)
    if @message.valid?
      redirect_to cohort_path(params[:cohort_id]), notice: "Message sent successfully"
    else
      redirect_to cohort_path(params[:cohort_id])
    end
  end

  def message_params
    params.require(:message).permit(:title, :content, :name, :email, :cohort_id)
  end
end
