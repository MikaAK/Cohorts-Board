class AdminMailer < ActionMailer::Base
  default from: ENV['ADMIN_EMAIL']

  def send_visitor(message, employer, url)
    @message = message
    url = access_url(employer, url).prepend "\nLink: "

    mail(to: @message.email,
         subject: @message.title,
         body:  @message.content << url).deliver
  end

  def new_student(student, url)
    message = "You have been added to the cohort board, please make sure to update your "
    message << "information at \n\n" << access_url(student, url)
    message << "\n\n Welcome to THE JOB SEARCH"
    mail(to: student.email,
         subject: "You've been added to the job search",
         body: message).deliver
  end

  private

  def access_url(user, url)
    user_class = user.class.to_s.downcase
    user.is_a?(Student) ? user_class : user_class.pluralize!
    "#{url}/#{user_class}/authenticate/#{user.uuid}"
  end
end
