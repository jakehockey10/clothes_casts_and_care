require 'test_helper'

class FeedbacksControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @feedback = feedbacks(:one)
    @admin = admins(:jake)
  end

  test 'should redirect index if not admin' do
    get :index
    assert_redirected_to root_path
  end

  test 'should get index' do
    sign_in @admin
    get :index
    assert_response :success
    assert_not_nil assigns(:feedbacks)
    sign_out @admin
  end

  test 'should redirect new if not admin' do
    get :new
    assert_redirected_to root_path
  end

  test 'should get new' do
    sign_in @admin
    get :new
    assert_response :success
    sign_out @admin
  end

  test 'should redirect create if not admin'do
    assert_no_difference('Feedback.count') do
      post :create, feedback: { challenges: 'none', meet_needs_answer: 1, suggestions: 'none' }
    end
    assert_redirected_to root_path
  end

  test 'should create feedback' do
    sign_in @admin
    assert_difference('Feedback.count') do
      post :create, feedback: { challenges: 'none', meet_needs_answer: 1, suggestions: 'none' }
    end
    assert_redirected_to feedback_path(assigns(:feedback))
    sign_out @admin
  end

  test 'should show feedback' do
    get :show, id: @feedback
    assert_response :success
  end

  # test 'should get edit' do
  #   get :edit, id: @feedback
  #   assert_response :success
  # end

  # test 'should update feedback' do
  #   patch :update, id: @feedback, feedback: { challenges: @feedback.challenges, meet_needs_answer: @feedback.meet_needs_answer, suggestions: @feedback.suggestions }
  #   assert_redirected_to feedback_path(assigns(:feedback))
  # end

  # test 'should destroy feedback' do
  #   assert_no_difference('Feedback.count') do
  #     delete :destroy, id: @feedback
  #   end
  #
  #   sign_in @admin
  #
  #   assert_difference('Feedback.count', -1) do
  #     delete :destroy, id: @feedback
  #   end
  #
  #   assert_redirected_to feedbacks_path
  #
  #   sign_out @admin
  # end
end
