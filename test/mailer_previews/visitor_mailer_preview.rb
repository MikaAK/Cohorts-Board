class VisitorMailerPreview < ActionMailer::Preview
  def send_inquiry
    @message = Message.new(title: 'Subject',
                           content: 'Billy Bob, Selfer, Soil, Sias, Sial23 wer',
                           email: 'me@mikakalathil.ca',
                           name: 'Bobby',
                           cohort_id: 1)
    VisitorMailer.send_inquiry(@message)
  end
end
