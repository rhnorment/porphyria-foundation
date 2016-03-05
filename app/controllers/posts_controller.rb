class PostsController < ApplicationController
  def index
    @posts = Post.published
  end

  def show
    post = Post.find(params[:id])

    if post.is_published?
      @post = post
    else
      redirect_to not_found_url
    end
  end
end
