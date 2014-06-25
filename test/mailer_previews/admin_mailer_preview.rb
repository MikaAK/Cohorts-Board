class AdminMailerPreview < ActionMailer::Preview
  def send_visitor
    message = Message.new(cohort_id: 1, content: 'This is the message', name: 'Bob', title: 'Subject', email: "mikakalathil@gmail.com")
    AdminMailer.send_visitor(message, Visitor.last, 'www.lighthouselabs.ca/cohortboard')
  end
end
