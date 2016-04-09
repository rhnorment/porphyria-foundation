# == Schema Information
#
# Table name: posts
#
#  id            :integer          not null, primary key
#  body          :text             default("")
#  image         :string           default("")
#  slug          :string
#  published     :boolean          default(FALSE)
#  published_at  :datetime
#  title         :string           default("")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  admin_user_id :integer
#  intro         :string           default("")
#

class PostsController < ApplicationController
  def index
    @posts = Post.published.includes(:admin_user).page params[:page]
  end

  def show
    post = Post.find_by(id: params[:id])

    if post.is_published?
      @post = post
    else
      redirect_to posts_url
    end

  end
end
