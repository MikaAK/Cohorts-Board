class AdminMailer < ActionMailer::Base
  default from: ENV['ADMIN_EMAIL']

  def send_visitor(message, visitor, url)
    @message = message
    url = visitor.access_url(url).prepend "\nLink: "

    mail(to: @message.email,
         subject: @message.title,
         body:  @message.content << url).deliver
  end

  def new_student(student, url)
    message = "You have been added to the cohort board, please make sure to update your "
    message << "information at \n\n" << student.access_url(url)
    message << "\n\n Welcome to THE JOB SEARCH"
    mail(to: student.email,
         subject: "You've been added to the job search",
         body: message).deliver
  end
end
