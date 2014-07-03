class AdminMailerPreview < ActionMailer::Preview
  def send_employer
    message = Message.new(cohort_id: 1, content: 'This is the message', name: 'Bob', title: 'Subject', email: "mikakalathil@gmail.com")
    AdminMailer.send_employer(message, Employer.last, 'www.lighthouselabs.ca/cohortboard')
  end
end
