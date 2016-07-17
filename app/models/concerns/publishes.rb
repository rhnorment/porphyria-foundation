module Publishes
  extend ActiveSupport::Concern

  included do
    scope             :published,       -> { where(published: true).where('published_at <= ?', DateTime.now).order(published_at: :desc) }
    scope             :unpublished,     -> { where(published: false) }
  end

  def is_not_published?
    !published
  end

  def is_published?
    published
  end

  def publish
    return if is_published?

    update(published: true, published_at: DateTime.now, publish_on: nil)
  end

  def is_scheduled?
    publish_on < DateTime.now
  end

  def unpublish
    return if is_not_published?

    update(published: false, published_at: nil, publish_on: nil)
  end
end