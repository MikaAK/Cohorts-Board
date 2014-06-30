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

  def inquire_params
    { name: params[:name],
      email: params[:email],
      content: params[:message][:content],
      title: params[:message][:title] }
  end
end
