# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  author       :string           default("")
#  body         :text             default("")
#  image        :string           default("")
#  slug         :string
#  published    :boolean          default(FALSE)
#  published_at :datetime
#  title        :string           default("")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Post < ActiveRecord::Base

  mount_uploader    :image, ImageUploader

  to_param          :slug

  scope             :published,   -> { where(published: true).where('published_at <= ?', DateTime.now) }
  scope             :unpublished, -> { where(published: false) }

  validates         :author,    presence: true
  validates         :body,      presence: true
  validates         :slug,      uniqueness: true
  validates         :title,     uniqueness: true

  before_validation :generate_slug

  def is_not_published?
    !published
  end

  def is_published?
    published
  end

  def publish
    return if is_published?

    update_attributes(published: true, published_at: Time.now)
  end

  def unpublish
    return if is_not_published?

    update_attributes(published: false, published_at: nil)
  end

  def generate_slug
    return unless slug.blank?

    self.slug ||= title.parameterize if title
  end

end
