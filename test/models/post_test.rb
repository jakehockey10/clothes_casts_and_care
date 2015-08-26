require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @admin = admins(:jake)
    @post = Post.new(admin: @admin, title: 'BANANAS', content: 'This is what else I have to say about BANANAS!!!')
  end

  test 'should be valid' do
    assert @post.valid?
  end

  test 'title should be present' do
    @post.title = nil
    assert_not @post.valid?
  end

  test 'admin should be present' do
    @post.admin = nil
    assert_not @post.valid?
  end

  # test 'must have unique title' do
    # post_copy = @post.dup
    # proc { post_copy.save! }.must_raise Vali
    # post_copy.errors.must_include(:title)
  # end
end
