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
    crop = 'mpad'
    height = 600
    width = 800

    image = post.image.blank? ? 'default_image.png' : post.image_url
    image_source = cl_image_tag(image, height: height, width: width, crop: crop)

    case controller_name && action_name
    when 'pages' && 'home'
      link_to image_source, post, class: 'featured-image'

    when 'posts' && 'index'
      content_tag :div, class: 'media' do
        link_to image_source, post, class: 'featured-image'
      end

    when 'posts' && 'show'
      content_tag :div, class: 'media' do
        image_source
      end
    end
  end

  def intro_for(post)
    content_tag :p, post.intro, class: 'post-intro' unless post.intro.blank?
  end
end

