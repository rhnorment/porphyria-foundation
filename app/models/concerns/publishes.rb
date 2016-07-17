module Publishes
  extend ActiveSupport::Concern

  included do
    scope             :published,       -> { where(published: true).where('published_at <= ?', DateTime.now).order(published_at: :desc) }
    scope             :unpublished,     -> { where(published: false) }
  end

  def is_not_published?
    !published || !published_at_is_in_past?
  end

  def is_published?
    published && published_at_is_in_past?
  end

  def publish
    return if is_published?

    update_attributes(published: true, published_at: Time.now)
  end

  def published_at_is_in_past?
    published_at <= DateTime.now
  end

  def unpublish
    return if is_not_published?

    update_attributes(published: false, published_at: nil)
  end
end