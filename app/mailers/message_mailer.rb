class MessageMailer < ApplicationMailer

  default to: 'clothescastscare@gmail.com'

  def message_me(msg)
    @msg = msg
    # mail from: @msg.email, subject: @msg.subject, body: @msg.content
    mail subject: @msg.subject
  end
end
