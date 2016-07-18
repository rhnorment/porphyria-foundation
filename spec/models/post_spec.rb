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
#  publish_on    :datetime
#

require 'rails_helper'

RSpec.describe Post, type: :model do

  let(:resource_class) { 'Post' }
  let(:all_resources)  { ActiveAdmin.application.namespaces[:admin].resources }
  let(:resource)       { all_resources[resource_class] }

  it 'has a valid resource name' do
    expect(resource.resource_name).to eql('Post')
  end

  it 'should display in the menu bar' do
    expect(resource).to be_include_in_menu
  end

  it 'has the default set of CRUD actions available to it' do
    expect(resource.defined_actions).to include(:index, :show, :new, :create, :edit, :update, :destroy)
  end

  it 'has a valid factory' do
    expect(Post.new(post_attributes)).to be_valid
    expect(Post.new(post_attributes(published: false))).to be_valid
  end

  it { should have_db_column(:admin_user_id).of_type(:integer) }
  it { should have_db_column(:body).of_type(:text) }
  it { should have_db_column(:image).of_type(:string) }
  it { should have_db_column(:intro).of_type(:string) }
  it { should have_db_column(:slug).of_type(:string) }
  it { should have_db_column(:published).of_type(:boolean) }
  it { should have_db_column(:publish_on).of_type(:datetime) }
  it { should have_db_column(:published_at).of_type(:datetime) }
  it { should have_db_column(:title).of_type(:string) }

  it { should have_db_index(:slug) }
  it { should have_db_index(:admin_user_id) }

  it { should belong_to(:admin_user) }
  it { should have_many(:tags).through(:taggings) }

  it { should validate_presence_of(:admin_user_id) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:title) }

  it { should validate_uniqueness_of(:slug) }

  it { should respond_to(:admin_user_id) }
  it { should respond_to(:body) }
  it { should respond_to(:id) }
  it { should respond_to(:image) }
  it { should respond_to(:intro) }
  it { should respond_to(:slug) }
  it { should respond_to(:published) }
  it { should respond_to(:published_at) }
  it { should respond_to(:title) }

  it { should respond_to(:is_not_published?) }
  it { should respond_to(:is_published?) }
  it { should respond_to(:is_scheduled?) }
  it { should respond_to(:publish) }
  it { should respond_to(:unpublish) }
  it { should respond_to(:tag!) }
  it { should respond_to(:tag_list) }
  it { should respond_to(:tag_list=) }

  include_context 'posts'

  describe 'post archive dates' do
    let(:archive_dates) { Post.archive_dates }

    it 'should scope to the archive dates' do
      expect(Post.archive_dates).to eql(['November 2011', 'October 2010'])
    end

    it 'should list the archive dates in a revers sort' do
      expect(Post.archive_dates).to_not eql(['October 2010', 'November 2011'])
    end
  end

  describe 'should scope to published posts' do
    it 'should list published posts' do
      expect(Post.published).to include(post_1)
    end

    it 'should not list unpublished posts' do
      expect(Post.published).to_not include(unpublished_post)
    end
  end

  describe 'should scope to unpublished posts' do
    it 'should list unpublished posts' do
      expect(Post.unpublished).to include(unpublished_post)
    end

    it 'should not list published posts' do
      expect(Post.unpublished).to_not include(post_1)
    end
  end

  describe '#is_published?' do
    context 'when post is published' do
      it 'should return true' do
        expect(post_1.is_published?).to be_truthy
      end

      it 'should not return false' do
        expect(post_1.is_published?).to_not be_falsey
      end
    end

    context 'when post is not published' do
      it 'should return false' do
        expect(unpublished_post.is_published?).to be_falsey
      end

      it 'should not return true' do
        expect(unpublished_post.is_published?).to_not be_truthy
      end
    end
  end

  describe '#is_not_published' do
    context 'when post is published' do
      it 'should return false' do
        expect(post_1.is_not_published?).to be_falsey
      end

      it 'should return not true' do
        expect(post_1.is_not_published?).to_not be_truthy
      end
    end

    context 'when post is not published' do
      it 'should be true' do
        expect(unpublished_post.is_not_published?).to be_truthy
      end

      it 'should not be false' do
        expect(unpublished_post.is_not_published?).to_not be_falsey
      end
    end
  end

  describe '#is_scheduled?' do
    context 'when published flag is set'

    context 'when published flag is not set'

    context 'when publish_on date has not arrived yet'

    context 'when publish_on date has arrived'
  end

  describe '#publish' do
    context 'when a post is not published' do
      it 'should publish the post' do
        expect(unpublished_post.publish).to be_truthy
      end
    end

    context 'when a post is published' do
      it 'should not publish the post' do
        expect(post_1.publish).to be_falsey
      end
    end
  end

  describe '#i'

  describe '#unpublish?' do
    context 'when the post is not published' do
      it 'should not publish the post' do
        expect(unpublished_post.unpublish).to be_falsey
      end
    end

    context 'when the post is published' do
      it 'should publish the post' do
        expect(post_1.unpublish).to be_truthy
      end
    end
  end

  describe '.find_by_date_month' do
    let(:date_month) { 'October 2010' }

    it 'should return all posts within the date_month range' do
      expect(Post.find_by_date_month(date_month)).to include(post_1)
    end

    it 'should not return posts not withing the date_month range' do
      expect(Post.find_by_date_month(date_month)).to_not include(post_2)
    end

    it 'should not return unpublished posts' do
      expect(Post.find_by_date_month(date_month)).to_not include(unpublished_post)
    end
  end

  describe 'post tags' do
    before do
      post_1.tag_list = 'new, tags, here'
      post_1.save
      post_1.reload
    end

    it 'adds tags to post' do
      expect(post_1.tags.size).to eql(3)
    end

    it 'updates with new tags added' do
      post_1.tag_list = 'new, tags, here, plus'
      post_1.save
      expect(post_1.tags.size).to eql(4)
    end

    it 'removes tags that were removed' do
      post_1.tag_list = 'new'
      post_1.save
      expect(post_1.tags.size).to eql(1)
    end
  end

end
