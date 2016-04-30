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

FactoryGirl.define do
  factory :published_post, class: 'Post' do
    admin_user_id 1
    title         'Published Post Title'
    body          'This is the body of the published post.'
    image         'post_image.jpg'
    intro         'This is the intro to the published post'
    slug          { title.parameterize }
    published     true
    published_at  Time.now
  end

  factory :unpublished_post, class: 'Post' do
    admin_user_id 1
    title         'Unpublished Post Title'
    body          'This is the body of the unpublished post.'
    image         'post_image.jpg'
    intro         'This is the intro to the unpublished post'
    slug          { title.parameterize }
    published     false
    published_at  nil
  end

  factory :post_without_image, class: 'Post' do
    admin_user_id 1
    title         'Post Without Image'
    body          'This is the body of the post without an image.'
    image         nil
    intro         'This is the intro to the post without an image'
    slug          { title.parameterize }
    published     true
    published_at  Time.now
  end

  factory :post_with_tags, class: 'Post', parent: :post do |post|
    post.after_create { |p| p.tag!('Rails', 'a great tag', 'test') }
  end
end
