class VisitorsController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.valid?
      new_visitor = find_or_create_visitor
      AdminMailer.send_visitor(@message, new_visitor, request.env['HTTP_HOST'])
      flash[:success] = "Message sent successfully"
    else
      flash[:error] = "Message send unsuccessfull"
    end
    redirect_to root_path
  end

  def inquire
    inquire_params = params.require(:message).permit(:content, :phone_number, :name, :email, :title, :students)
    @message = Message.new(inquire_params)
    binding.pry
    if @message.valid?
      VisitorMailer.send_inquiry(@message)
      flash[:success] = "Message send successfully"
    else
      flash[:error] = "Message send unsuccessfull"
    end
    redirect_to root_path
  end

  private

  def message_params
    { name: params[:name],
      email: params[:email],
      content: params[:message][:content],
      title: params[:message][:title] }
  end

  def find_or_create_visitor
    visitor = Visitor.where(email: @message.email).first_or_create do |visitor|
      visitor.first_name = @message.name
      visitor.email = @message.email
    end
    Visitor.find visitor
  end
end
