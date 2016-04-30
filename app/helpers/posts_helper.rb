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

module PostsHelper

  def image_for(post)
    content_tag :div, image_tag(post.image_url), class: 'media' unless post.image.nil?
  end

  def intro_for(post)
    content_tag :p, post.intro, class: 'post-intro' unless post.intro.blank?
  end

end
