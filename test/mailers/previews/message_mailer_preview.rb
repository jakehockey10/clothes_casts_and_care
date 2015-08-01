# Preview all emails at http://localhost:3000/rails/mailers/message_mailer
class MessageMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/message_mailer/message_me
  def message_me
    msg = Message.new(
        name: 'Bob Saget',
        email: 'bobsaget@gmail.com',
        subject: 'hi',
        content: 'kthxbai'
    )
    MessageMailer.message_me(msg)
  end

end
