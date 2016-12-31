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

require 'populator'
require 'faker'

# **************   re-populate database ****************

namespace :db do
  desc 'Erase and populate Post database for testing Views'

  task populate_posts: :environment do
    Post.delete_all

    Post.populate(30) do |post|
      post.admin_user_id = 1
      post.body = Faker::Lorem.paragraph(10)
      post.image = 'sample.jpg'
      post.intro = Faker::Lorem.sentences(2)
      post.published = true
      post.published_at = Time.now
      post.title = Faker::Lorem.sentence
      post.slug = post.title.parameterize
    end
  end

  task populate_tags: :environment do
    Tag.delete_all

    Tag.create(name: 'General')
    Tag.create(name: 'Disease')
    Tag.create(name: 'Porphyria Disease')
  end

  task add_tags_to_posts: :environment do
    Tagging.delete_all

    posts = Post.all
    tags = Tag.all

    posts.each do |post|
      post.tags.push(tags[rand(tags.size)])
    end
  end

end
