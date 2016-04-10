# == Schema Information
#
# Table name: posts
#
#  id            :integer          not null, primary key
#  body          :text             default("")
#  image         :string           default("")
#  slug          :string
#  published     :boolean          default(FALSE)
#  published_at  :datetime
#  title         :string           default("")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  admin_user_id :integer
#  intro         :string           default("")
#

class Post < ActiveRecord::Base

  default_scope                   { includes(:tags) }
  mount_uploader                  :image, ImageUploader
  paginates_per                   10
  to_param                        :slug

  scope             :default,     -> { where(:published) }
  scope             :published,   -> { where(published: true).where('published_at <= ?', DateTime.now).order(published_at: :desc) }
  scope             :unpublished, -> { where(published: false) }

  belongs_to        :admin_user
  has_many          :taggings
  has_many          :tags,        -> { order(id: :asc) }, through: :taggings, dependent: :destroy

  validates         :admin_user_id,   presence: true
  validates         :body,            presence: true
  validates         :slug,            uniqueness: true
  validates         :title,           presence: true, uniqueness: true

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

  def tag!(tags_attr)
    self.tags = tags_attr.map(&:strip).reject(&:blank?).map do |tag|
      Tag.where(name: tag).first_or_create
    end
  end

  def tag_list
    self.tags.map { |tag| tag.name }.join(', ') if self.tags
  end

  def tag_list=(tags_attr)
     self.tag!(tags_attr.split(','))
  end

  def unpublish
    return if is_not_published?

    update_attributes(published: false, published_at: nil)
  end

  protected

    def generate_slug
      return unless slug.blank?

      self.slug ||= title.parameterize if title
    end

end
