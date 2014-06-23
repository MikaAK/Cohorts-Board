class VisitorMailer < ActionMailer::Base

  def inquire(message, visitor)
    @message = message
    binding.pry
    mail(from: visitor.email,
         to: 'mikakalathil@gmail.com',
         title: @message.title,
         body: @message.content).deliver
  end
end
