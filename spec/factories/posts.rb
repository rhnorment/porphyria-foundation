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

FactoryGirl.define do
  factory :post do
    author        'Example Blogger'
    body          'This is the body of the post.'
    image         'post_image.jpg'
    post_url      ''
    published     false
    published_at  nil
    title         'Example Blog Title'

    factory :published_post do
      published     true
      published_at  Time.now
    end

  end
end