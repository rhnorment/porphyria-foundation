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
  include           Publishes
  include           Tags
  mount_uploader    :image, ImageUploader
  paginates_per     10
  to_param          :slug

  scope             :archive_dates,   -> { published.limit(100).pluck(:published_at).sort.reverse.map { |date| date.strftime('%B %Y') }.uniq || {} }
  scope             :default,         -> { where(:published) }

  belongs_to        :admin_user

  before_validation :generate_slug

  validates         :admin_user_id,   presence: true
  validates         :body,            presence: true
  validates         :published_at,    not_in_past: true
  validates         :slug,            uniqueness: true
  validates         :title,           presence: true, uniqueness: true

  def self.find_by_date_month(date_month)
    date = Date.parse(date_month)
    published.where(published_at: date.beginning_of_month..date.end_of_month)
  end

  protected

  def generate_slug
    self.slug ||= title.parameterize if title
  end

end
