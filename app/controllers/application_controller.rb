class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def get_active_tags
    @tags = Tag.with_posts
  end

  def get_post_archive
    @archive_posts = {}
    @first_post_year = DateTime.now.year

    posts = Post.published.limit(100)  # limit to 100 for safety reasons

    if posts.length > 0
      @archive_posts = posts.group_by { |post| post.published_at.beginning_of_month.strftime('%Y %-m') }
      @first_post_year = posts.last.published_at.year
    end
  end

  private

    def record_not_found
      redirect_to posts_url
    end
end
