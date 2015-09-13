require 'test_helper'

class CreatingFeedbackSendsEmailTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
    # @admin = users(:jake)
  end

  test 'creating feedback sends email' do
    get new_feedback_path
    assert_template 'feedbacks/new'
    # Missing info
    post feedbacks_path, feedback: { meet_needs_answer: 0 }
    assert_not flash.empty?
    assert_template 'feedbacks/new'
    post feedbacks_path, feedback: { meet_needs_answer: 6 }
    assert_not flash.empty?
    assert_template 'feedbacks/new'
    # Meet needs answer specified
    post feedbacks_path, feedback: { meet_needs_answer: 5 }
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_not flash.empty?
    @feedback = assigns(:feedback)
    assert_redirected_to feedback_path(@feedback)
    follow_redirect!
    assert_template 'feedbacks/show'
  end

end
