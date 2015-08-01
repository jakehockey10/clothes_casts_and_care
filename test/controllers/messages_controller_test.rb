require 'test_helper'

class MessagesControllerTest < ActionController::TestCase

  def setup
    ActionMailer::Base.deliveries.clear
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'successful post' do
    post :create, message: {
             name: 'cornholio',
             email: 'cornholio@example.com',
             subject: 'hi',
             content: 'bai'
                }
    assert_redirected_to new_message_path
    last_email = ActionMailer::Base.deliveries.last
    assert_equal 'hi', last_email.subject
    assert_equal 'clothescastscare@gmail.com', last_email.to[0]
    assert_equal 'cornholio@example.com', last_email.from[0]
    assert_match(/bai/, last_email.body.encoded)
  end

  test 'failed post' do
    post :create, message: {
             name: '',
             email: '',
             subject: '',
             content: ''
                }
    [:name, :email, :subject, :content].each do |attr|
      assert_select 'li', "#{attr.capitalize} can't be blank"
    end
  end
end
