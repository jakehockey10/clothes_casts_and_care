require 'test_helper'

class PatternsControllerTest < ActionController::TestCase

  def setup
    @admin = admins(:jake)
    @pattern = patterns(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get show' do
    get :show, id: @pattern.id
    assert_response :success
  end

  test 'should redirect new if not admin' do
    get :new
    assert_redirected_to root_path
  end

  test 'should get new' do
    sign_in @admin
    # get :new, format: :js
    xhr :get, :new, format: :js
    assert_response :success
    sign_out @admin
  end

  test 'should redirect create if not admin' do
    assert_no_difference('Pattern.count') do
      post :create, pattern: { name: 'silly pattern', admin: @admin }
    end
    assert_redirected_to root_path
  end

  # test 'should get create' do
  #   get :create
  #   assert_response :success
  # end
  #
  # test 'should get destroy' do
  #   get :destroy
  #   assert_response :success
  # end

end
