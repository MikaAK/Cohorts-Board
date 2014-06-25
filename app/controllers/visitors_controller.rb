class VisitorsController < ApplicationController

  def create
    @message = Message.new(message_params)
    if @message.valid?
      new_visitor = find_or_create_visitor
      AdminMailer.send_visitor(@message, new_visitor, request.env['HTTP_HOST'])
      flash[:success] = "Message sent successfully"
      redirect_to cohorts_path
    else
      flash[:error] = "Message send unsuccessfull"
      render 'cohorts/index'
    end
  end

  def inquire
    inquire_params = params.require(:message).permit(:content, :phone_number, :name, :email, :title, :students)
    @message = Message.new(inquire_params)
    if @message.valid?
      VisitorMailer.send_inquiry(@message)
      flash[:success] = "Message send successfully"
      redirect_to cohorts_path
    else
      flash[:error] = "Message send unsuccessfull"
      render 'cohorts/index'
    end
  end

  private

  def message_params
    { name: params[:name],
      email: params[:email],
      content: params[:message][:content],
      title: params[:message][:title] }
  end

  def find_or_create_visitor
    Visitor.where(email: @message.email).first_or_create do |visitor|
      visitor.first_name = @message.name
      visitor.email = @message.email
    end
  end
end
