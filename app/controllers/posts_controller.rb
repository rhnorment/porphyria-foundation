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
    if params[:date_month].nil?
      @posts = Post.published.page params[:page]
    else
      @posts = Post.find_by_date_month(params[:date_month]).page params[:page]
      @date_month = params[:date_month]
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
