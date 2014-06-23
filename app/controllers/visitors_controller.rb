class VisitorsController < ApplicationController

  def new
    @message = Message.new(message_params)
    if @message.valid?
      new_visitor = Visitor.where(email: @message.email).first_or_create do |visitor|
        visitor.first_name = @message.name
        visitor.cohort_id = @message.cohort_id
      end
      AdminMailer.send_cohort(@message, new_visitor, request.env['HTTP_HOST'])
      flash[:success] = "Message sent successfully"
      binding.pry
      redirect_to cohort_path(params[:cohort])
    else
      flash[:error] = "Message send unsuccessfull"
      redirect_to cohort_path(params[:cohort])
    end
  end

  def message_params
    { cohort_id: params[:cohort][:id],
      name: params[:name],
      email: params[:email],
      content: params[:message][:content],
      title: params[:message][:title] }
  end
end
