class AdminMailer < ActionMailer::Base
  default from: "me@mikakalathil.ca"

  def send_visitor(message, visitor, url)
    @message = message
    url = visitor.url(url).prepend "\nLink: "

    mail(to: @message.email,
         subject: @message.title,
         body:  @message.content << url).deliver
  end

  def new_student(student, url)
    message = "You have been added to the cohort board, please make sure to update your "
    message << "information at" << student.access_url

    mail(to: student.email,
         subject: "You've been added to the job search",
         body: message).deliver
  end
end
