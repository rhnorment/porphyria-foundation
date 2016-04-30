# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TagsController < ApplicationController
  def show
    @tag = Tag.find_by(id: params[:id])

    if @tag
      @posts = @tag.posts_with_tag.includes(:admin_user).page params[:page]

      get_active_tags
      get_post_archive
    else
      redirect_to posts_url
    end
  end
end
