class Employers::InquiriesController < Employers::BaseController
  def create
    inquire_params = params.require(:message).permit(:content, :phone_number, :name, :email, :title, :students)
    @message = Message.new(inquire_params)
    if @message.valid?
      EmployerMailer.send_inquiry(@message)
      flash[:success] = "Message send successfully"
    else
      flash[:error] = "Message send unsuccessfull"
    end
    redirect_to employers_root_path
  end

  private

  def message_params
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
