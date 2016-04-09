# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TagsController < ApplicationController
  def show
    tag = retrieve_tag

    if tag
      @posts = tag.posts_with_tag
    else
      redirect_to posts_url
    end
  end

  private

    def retrieve_tag
      Tag.where('lower(name) = ?', params[:tag].mb_chars.to_s.downcase).first
    end
end
