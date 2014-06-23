class AdminMailer < ActionMailer::Base
  default from: "mikakalathil@gmail.com"

  def send_cohort(message, visitor, url)
    @message = message
    url = visitor.url(url)

    mail(to: 'mikakalathil@gmail.com',
         subject: @message.title,
         body:  @message.content << url).deliver
  end
end
