class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def get_active_tags
    @tags = Tag.with_posts
  end

  def get_post_archive
    @dates = get_dates
  end

  private

    def get_dates
      dates = []
      archive_posts = Post.archive.sort

      archive_posts.each do |key, value|
        dates.push(key)
      end

      dates.flatten.uniq
    end

    def record_not_found
      redirect_to posts_url
    end
end
