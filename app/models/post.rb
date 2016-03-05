# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  author       :string           default("")
#  body         :text             default("")
#  image        :string           default("")
#  slug         :string           default("")
#  published    :boolean          default(FALSE)
#  published_at :datetime
#  title        :string           default("")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Post < ActiveRecord::Base

  mount_uploader    :image, ImageUploader

  scope             :published,   -> { where(published: true).where("published_at <= ?", DateTime.now) }
  scope             :unpublished, -> { where(published: false) }

  before_validation :generate_slug

  validates         :author,    presence: true
  validates         :body,      presence: true
  validates         :slug,      uniqueness: { case_sensitive: false }
  validates         :title,     presence: true

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

  protected

    def generate_slug
      self.slug ||= title.parameterize if title
    end

end
