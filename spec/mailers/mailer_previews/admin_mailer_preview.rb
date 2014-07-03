class AdminMailerPreview < ActionMailer::Preview
  def new_employer
    message = Message.new(cohort_id: 1, content: 'This is the message', name: 'Bob', title: 'Subject', email: "mikakalathil@gmail.com")
    AdminMailer.new_employer(message, Employer.last, 'www.lighthouselabs.ca/cohortboard')
  end

  def new_student
    student = Student.last
    AdminMailer.new_student(student, 'www.lighthouselabs.ca/cohortboard')
  end
end
