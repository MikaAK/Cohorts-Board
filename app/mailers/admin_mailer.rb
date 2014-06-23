class AdminMailer < ActionMailer::Base
  default from: "mikakalathil@gmail.com"

  def send_cohort(message)
    binding.pry

    mail(to: message.email,
         subject: message.title,
         body:  message.content).deliver
  end
end
