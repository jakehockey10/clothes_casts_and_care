require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase
  def setup
    @feedback = Feedback.new(meet_needs_answer: 2,
                             suggestions: 'Cannot think of anything in particular...Keep up the good work!',
                             challenges: 'I found it quite simple and did not run into any challenges.')
  end

  test 'should be valid' do
    assert @feedback.valid?
  end

  test 'meet_needs_answer should be present' do
    @feedback.meet_needs_answer = nil
    assert_not @feedback.valid?
  end

  test 'meet_needs_answer should be 1 through 5' do
    @feedback.meet_needs_answer = 0
    assert_not @feedback.valid?
    @feedback.meet_needs_answer = 1
    assert @feedback.valid?
    @feedback.meet_needs_answer = 2
    assert @feedback.valid?
    @feedback.meet_needs_answer = 3
    assert @feedback.valid?
    @feedback.meet_needs_answer = 4
    assert @feedback.valid?
    @feedback.meet_needs_answer = 5
    assert @feedback.valid?
    @feedback.meet_needs_answer = 6
    assert_not @feedback.valid?
  end

  test 'suggestions and challenges are optional' do
    @feedback.suggestions = ''
    @feedback.challenges = ''
    assert @feedback.valid?
  end
end
