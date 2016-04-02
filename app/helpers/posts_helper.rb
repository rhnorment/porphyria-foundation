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

module PostsHelper

  def image_for(post)
    unless post.image.blank?
      content_tag :div, image_tag(post.image_url), class: 'media'
    end
  end

  def intro_for(post)
    content_tag :p, Faker::Lorem.sentence(12), class: 'post-intro'
  end

end
