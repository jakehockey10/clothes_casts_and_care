require 'test_helper'

class NewFeedbackMailerTest < ActionMailer::TestCase

  def setup
    ActionMailer::Base.deliveries.clear
  end

  test 'new feedback' do
    email = NewFeedbackMailer.new_feedback.deliver_now
    refute ActionMailer::Base.deliveries.empty?
    assert_equal ['clothescastscare@gmail.com'], email.to
    assert_equal 'Feedback received @ SpicaCastCare.com!', email.subject
    assert_match 'click here:', email.body.encoded
    assert_match '/feedbacks', email.body.encoded
  end

end
