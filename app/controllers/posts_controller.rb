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
    @posts = Post.published.page params[:page]

    get_active_tags
    get_post_archive

    if params[:tags].present?
      tags = Tag.where(name: params[:tags].split(', ')).pluck(:id)
      @posts = @posts.joins(:taggings).where('taggings.tag_id in (?)', tags )
    end
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
