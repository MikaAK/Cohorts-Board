class AdminMailer < ActionMailer::Base
  default from: "me@mikakalathil.ca"

  def send_cohort(message, visitor, url)
    @message = message
    url = visitor.url(url).prepend "\nLink: "

    mail(to: 'mikakalathil@hotmail.com',
         subject: @message.title,
         body:  @message.content << url).deliver
  end
end
