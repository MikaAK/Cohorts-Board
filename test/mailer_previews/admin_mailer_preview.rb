class AdminMailerPreview < ActionMailer::Preview
  def send_cohort
    message = Message.new(cohort_id: 1, content: 'This is the message', name: 'Bob', title: 'Subject', email: "mikakalathil@gmail.com")
    AdminMailer.send_cohort(message, Visitor.last, 'www.lighthouselabs.ca/cohortboard')
  end
end
