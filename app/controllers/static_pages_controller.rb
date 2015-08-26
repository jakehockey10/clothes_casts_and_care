class StaticPagesController < ApplicationController
  def home
    @posts = Post.all
  end

  def patterns
  end

  def about
  end

  def start_your_own
  end
end
