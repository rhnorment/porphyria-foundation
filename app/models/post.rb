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

  scope             :published,   -> { where(published: true) }
  scope             :unpublished, -> { where.not(:published) }

  validates         :author,    presence: true
  validates         :body,      presence: true
  validates         :post_url,  uniqueness: true
  validates         :title,     presence: true

  def published?
    published
  end

end
