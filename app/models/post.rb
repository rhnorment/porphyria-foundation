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

#####  TODO:  change author field to admin_user

class Post < ActiveRecord::Base

  mount_uploader    :image, ImageUploader
  paginates_per     10
  to_param          :slug

  scope             :published,   -> { where(published: true).where('published_at <= ?', DateTime.now).order(published_at: :desc) }
  scope             :unpublished, -> { where(published: false) }

  belongs_to        :admin_user

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

  def unpublish
    return if is_not_published?

    update_attributes(published: false, published_at: nil)
  end

  def generate_slug
    return unless slug.blank?

    self.slug ||= title.parameterize if title
  end

end
