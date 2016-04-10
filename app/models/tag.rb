# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ActiveRecord::Base

  scope       :with_posts,    -> { select { |tag| tag.frequency > 0 } }

  validates   :name, presence: true, uniqueness: true

  has_many    :taggings
  has_many    :posts, through: :taggings

  def frequency
    posts_with_tag.size
  end

  def posts_with_tag
    self.posts.published
  end

end