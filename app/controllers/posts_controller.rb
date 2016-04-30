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
    if params[:archive].nil?
      @posts = Post.published.page params[:page]
    else
      @posts = Post.unpublished.page params[:page]
    end

    get_active_tags
    get_post_archive
  end

  def show
    post = Post.find_by(id: params[:id])

    if post.is_published?
      @post = post

      get_active_tags
      get_post_archive
    else
      redirect_to posts_url
    end
  end

end
