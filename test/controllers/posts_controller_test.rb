require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @post = posts(:one)
    @admin = admins(:jake)
    @bob = admins(:bob)
  end

  test 'should show post' do
    get :show, id: @post
    assert_response :success
    sign_out @admin if is_logged_in?
  end

  test 'should redirect new if not admin' do
    assert_no_difference('Post.count') do
      post :create, post: { admin: @post.admin, title: @post.title }
    end
    assert_redirected_to root_path
    sign_out @admin
  end

  test 'should get new' do
    sign_in @admin
    get :new
    assert_response :success
    sign_out @admin
  end

  test 'should redirect create if not admin' do
    assert_no_difference('Post.count') do
      post :create, post: { admin: @admin, title: 'cool title' }
    end
    assert_redirected_to root_path
  end

  test 'should create post' do
    sign_in @admin
    assert_difference('Post.count') do
      post :create, post: { admin: @admin, title: 'cooler title' }
    end
    assert_response :success
    sign_out @admin
  end

  test 'should redirect edit if not admin' do
    get :edit, id: @post
    assert_redirected_to root_url
  end

  test 'should get edit' do
    sign_in @admin
    get :edit, id: @post
    assert_response :success
    sign_out @admin
  end

  test 'should redirect update if not admin' do
    patch :update, id: @post, post: { admin: @bob, title: 'This is a different title' }
    assert_redirected_to root_url
  end

  test 'should update post' do
    sign_in @admin
    patch :update, id: @post, post: { admin: @bob, title: 'I am trying this again...' }
    assert_redirected_to @post
    sign_out @admin
  end

  test 'should redirect destroy if not admin' do
    assert_no_difference('Post.count') do
      delete :destroy, id: @post
    end
    assert_redirected_to root_path
  end

  test 'should destroy post' do
    sign_in @admin
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end
    assert_redirected_to posts_path
    sign_out @admin
  end
end
