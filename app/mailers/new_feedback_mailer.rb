class NewFeedbackMailer < ApplicationMailer

  default to: 'clothescastscare@gmail.com'

  def new_feedback
    # mail from: @msg.email, subject: @msg.subject, body: @msg.content
    mail subject: 'Feedback received @ SpicaCastCare.com!'
  end
end
