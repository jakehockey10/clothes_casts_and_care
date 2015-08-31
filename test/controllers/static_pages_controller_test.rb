require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  def setup
    @base_title = 'Clothes, Casts, and Care'
  end

  test 'should get home' do
    get :home
    assert_response :success
    assert_select 'title', 'Clothes, Casts, and Care'
  end

  # test 'should get patterns' do
  #   get :patterns
  #   assert_response :success
  #   assert_select 'title', 'Patterns | Clothes, Casts, and Care'
  # end

  test 'should get about' do
    get :about
    assert_response :success
    assert_select 'title', 'About | Clothes, Casts, and Care'
  end

  test 'should get start_your_own' do
    get :start_your_own
    assert_response :success
    assert_select 'title', 'Start Your Own | Clothes, Casts, and Care'
  end

end
