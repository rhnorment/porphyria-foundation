# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  author       :string           default("")
#  body         :text             default("")
#  image        :string           default("")
#  slug         :string           default("")
#  published    :boolean          default(FALSE)
#  published_at :datetime
#  title        :string           default("")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class PostsController < ApplicationController
  def index
    @posts = Post.published
  end

  def show
    post = Post.find(params[:id])

    if post.is_published?
      @post = post
    else
      redirect_to posts_url
    end

  end
end
