class Admin::EmployersController < Admin::BaseController
  
  def create
    @message = Message.new(inquire_params)
    if @message.valid?
      new_employer = find_or_create_visitor
      AdminMailer.send_visitor(@message, new_employer, request.env['HTTP_HOST'])
      flash[:success] = "Message sent successfully"
    else
      flash[:error] = "Message send unsuccessfull"
    end
    redirect_to admin_root_path
  end

  private

  def inquire_params
    { name: params[:name],
      email: params[:email],
      content: params[:message][:content],
      title: params[:message][:title] }
  end

  def find_or_create_visitor
    employer = Employer.where(email: @message.email).first_or_create do |employer|
      employer.first_name = @message.name
      employer.email = @message.email
    end
    Employer.find employer
  end
end
