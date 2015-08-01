require 'test_helper'

class MessageMailerTest < ActionMailer::TestCase

  def setup
    ActionMailer::Base.deliveries.clear
  end

  test 'message me' do
    msg = Message.new(
                     name: 'cornholio',
                     email: 'cornholio@example.com',
                     subject: 'Hi',
                     content: 'Hello from the internet'
    )
    email = MessageMailer.message_me(msg).deliver_now
    refute ActionMailer::Base.deliveries.empty?
    assert_equal ['clothescastscare@gmail.com'], email.to
    assert_equal ['cornholio@example.com'], email.from
    assert_equal 'Hi', email.subject
    assert_match 'Hello from the internet', email.body.encoded
    assert_match 'cornholio@example.com', email.body.encoded
  end
end
