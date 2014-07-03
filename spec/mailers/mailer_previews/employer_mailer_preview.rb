class EmployerMailerPreview < ActionMailer::Preview
  def send_inquiry
    @message = Message.new(title: 'Subject',
                           students: 'Billy Bob, Selfer, Soil, Sias, Sial23 wer',
                           email: 'me@mikakalathil.ca',
                           name: 'Bobby',
                           cohort_id: 1)
    EmployerMailer.send_inquiry(@message)
  end
end
