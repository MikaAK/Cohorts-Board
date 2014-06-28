class Admin::EmployersController < Admin::BaseController
  def create
    @message = Message.new(message_params)
    if @message.valid?
      new_employer = find_or_create_visitor
      AdminMailer.send_visitor(@message, new_employer, request.env['HTTP_HOST'])
      flash[:success] = "Message sent successfully"
    else
      flash[:error] = "Message send unsuccessfull"
    end
    redirect_to root_path
  end
end
