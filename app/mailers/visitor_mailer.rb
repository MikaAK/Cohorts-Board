class VisitorMailer < ActionMailer::Base

  def send_inquiry(message)
    @message = message
    content = @message.print_students
    mail(from: @message.email,
         to: 'mikakalathil@gmail.com',
         title: @message.title,
         body: content).deliver
  end
end
