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

  default_scope     { includes(:tags) }
  mount_uploader    :image, ImageUploader
  paginates_per     10
  to_param          :slug

  scope             :archive_dates,   -> { published.limit(100).pluck(:published_at).sort.reverse.map { |date| date.strftime('%B %Y') }.uniq || {} }
  scope             :default,         -> { where(:published) }
  scope             :published,       -> { where(published: true).where('published_at <= ?', DateTime.now).order(published_at: :desc) }
  scope             :unpublished,     -> { where(published: false) }

  belongs_to        :admin_user
  has_many          :taggings
  has_many          :tags,             -> { order(id: :asc) }, through: :taggings, dependent: :destroy

  before_validation :generate_slug

  validates         :admin_user_id,   presence: true
  validates         :body,            presence: true
  validates         :slug,            uniqueness: true
  validates         :title,           presence: true, uniqueness: true

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

  def self.find_by_date_month(date_month)
    date = Date.parse(date_month)
    published.where(published_at: date.beginning_of_month..date.end_of_month)
  end

  protected

    def generate_slug
      self.slug ||= title.parameterize if title
    end

end
