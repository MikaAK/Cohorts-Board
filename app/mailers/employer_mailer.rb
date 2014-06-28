class EmployerMailer < ActionMailer::Base

  def send_inquiry(message)
    @message = message
    content = @message.print_students
    mail(from: @message.email,
         to: ENV['ADMIN_EMAIL'],
         title: @message.title,
         body: content).deliver
  end
end
