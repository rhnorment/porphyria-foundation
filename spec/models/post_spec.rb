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
    expect(build(:post)).to be_valid
    expect(build(:published_post)).to be_valid
  end

  it { should have_db_column(:author).of_type(:string) }
  it { should have_db_column(:body).of_type(:text) }
  it { should have_db_column(:image).of_type(:string) }
  it { should have_db_column(:intro).of_type(:string) }
  it { should have_db_column(:slug).of_type(:string) }
  it { should have_db_column(:published).of_type(:boolean) }
  it { should have_db_column(:published_at).of_type(:datetime) }
  it { should have_db_column(:title).of_type(:string) }

  it { should have_db_index(:slug) }

  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:title) }

  it { should validate_uniqueness_of(:slug) }

  it { should respond_to(:publish) }
  it { should respond_to(:unpublish) }
  it { should respond_to(:is_published?) }
  it { should respond_to(:is_not_published?) }

  let(:unpublished_post)  { create(:post) }
  let(:published_post)    { create(:published_post) }

  describe 'should scope to published posts' do
    it 'should list published posts' do
      expect(Post.published).to include(published_post)
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
      expect(Post.unpublished).to_not include(published_post)
    end
  end

  describe '#is_published?' do
    context 'when post is published' do
      it 'should return true' do
        expect(published_post.is_published?).to be_truthy
      end

      it 'should not return false' do
        expect(published_post.is_published?).to_not be_falsey
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
        expect(published_post.is_not_published?).to be_falsey
      end

      it 'should return not true' do
        expect(published_post.is_not_published?).to_not be_truthy
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

  describe '#publish' do
    context 'when a post is not published' do
      it 'should publish the post' do
        expect(unpublished_post.publish).to be_truthy
      end
    end

    context 'when a post is published' do
      it 'should not publish the post' do
        expect(published_post.publish).to be_falsey
      end
    end
  end

  describe '#unpublish?' do
    context 'when the post is not published' do
      it 'should not publish the post' do
        expect(unpublished_post.unpublish).to be_falsey
      end
    end

    context 'when the post is published' do
      it 'should publish the post' do
        expect(published_post.unpublish).to be_truthy
      end
    end
  end

end
