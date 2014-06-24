class VisitorsController < ApplicationController

  def new
    @message = Message.new(message_params)
    if @message.valid?
      new_visitor = find_or_create_visitor
      AdminMailer.send_cohort(@message, new_visitor, request.env['HTTP_HOST'])
      flash[:success] = "Message sent successfully"
      redirect_to cohort_path(params[:cohort])
    else
      flash[:error] = "Message send unsuccessfull"
      redirect_to cohort_path(params[:cohort])
    end
  end

  def inquire
    inquire_params = params.require(:message).permit(:content, :phone_number, :name, :cohort_id, :email, :title, :students)
    @message = Message.new(inquire_params)
    if @message.valid?
      VisitorMailer.send_inquiry(@message)
      flash[:success] = "Message send successfully"
    else
      flash[:error] = "Message send unsuccessfull"
    end
      redirect_to cohort_path(params.require(:message)[:cohort_id])
  end

  private

  def message_params
    { cohort_id: params[:cohort][:id],
      name: params[:name],
      email: params[:email],
      content: params[:message][:content],
      title: params[:message][:title] }
  end

  def find_or_create_visitor
    cohort_id = @message.cohort_id
    Visitor.where(email: @message.email).first_or_create do |visitor|
      visitor.first_name = @message.name
      visitor.cohort_id = cohort_id
    end
    Visitor.find cohort_id
  end
end
