# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  author       :string           default("")
#  body         :text             default("")
#  image        :string           default("")
#  post_url     :string           default("")
#  published    :boolean          default(FALSE)
#  published_at :datetime
#  title        :string           default("")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Post < ActiveRecord::Base

  scope             :published,   -> { where(published: true).where("published_at <= ?", DateTime.now) }
  scope             :unpublished, -> { where(published: false) }

  before_save       :generate_post_url

  validates         :author,    presence: true
  validates         :body,      presence: true
  validates         :post_url,  uniqueness: true
  validates         :title,     presence: true

  validate          :post_url_does_not_start_with_slash

  def published?
    published
  end

  protected

    def generate_post_url
      return unless self.post_url.blank?
      year = self.created_at.class == ActiveSupport::TimeWithZone ? self.created_at.year : DateTime.now.year
      self.post_url = "#{year}/#{self.title.parameterize}"
    end

    def post_url_does_not_start_with_slash
      errors.add(:post_url, I18n.t('activerecord.errors.models.post.attributes.post_url.start_with_slash')) if self.post_url.start_with?('/')
    end

end
