class PagesController < ApplicationController

  def home
    @posts = Post.published.limit(6)
    render :home
  end

end