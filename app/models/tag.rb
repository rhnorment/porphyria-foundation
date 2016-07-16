# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ActiveRecord::Base

  to_param            :slug

  scope               :with_posts,    -> { select { |tag| tag.frequency > 0 } }

  before_validation   :generate_slug

  validates           :name, presence: true, uniqueness: true
  validates           :slug, uniqueness: true

  has_many            :taggings
  has_many            :posts, through: :taggings

  def frequency
    posts_with_tag.count
  end

  def posts_with_tag
    self.posts.published
  end

  protected

    def generate_slug
      self.slug ||= name.parameterize if name
    end

end
