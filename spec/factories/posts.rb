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
#  intro        :string           default("")
#

FactoryGirl.define do
  factory :post do
    title         'Unpublished Post Title'
    author        'Example Blogger'
    body          'This is the body of the post.'
    image         'post_image.jpg'
    slug          { title.parameterize }
    published     false
    published_at  nil

    factory :published_post do
      title         'Published Post Title'
      slug          { title.parameterize }
      published     true
      published_at  Time.now
    end

  end
end
