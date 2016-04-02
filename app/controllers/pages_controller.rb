class PagesController < ApplicationController

  def home
    @posts = Post.published
    render :home
  end

end