# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Tag, type: :model do

  let(:resource_class)  { 'Tag' }
  let(:all_resources)   { ActiveAdmin.application.namespaces[:admin].resources }
  let(:resource)        { all_resources[resource_class] }

  it 'has a valid resource name' do
    expect(resource.resource_name).to eql('Tag')
  end

  it 'should display in the menu bar' do
    expect(resource).to be_include_in_menu
  end

  it 'has the default set of CRUD actions available to it' do
    expect(resource.defined_actions).to include(:index, :show, :new, :create, :edit, :update, :destroy)
  end

  it 'has a valid factory' do
    expect(Tag.new(tag_attributes)).to be_valid
  end

  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:slug).of_type(:string) }

  it { should have_db_index(:slug) }

  it { should have_many(:posts).through(:taggings) }

  it { should validate_presence_of(:name) }

  it { should validate_uniqueness_of(:name) }
  it { should validate_uniqueness_of(:slug) }

  it { should respond_to(:id) }
  it { should respond_to(:name) }
  it { should respond_to(:posts_with_tag) }
  it { should respond_to(:frequency) }

  # Instance methods:
  include_context 'posts'
  include_context 'tags'

  describe '#posts_with_tag' do
    before { tag_posts }

    it 'should list the posts associated with each tag' do
      expect(tag_1.posts_with_tag).to include(post_1)
      expect(tag_3.posts_with_tag).to include(post_2)
    end

    it 'should not list the posts not associated with each tag' do
      expect(tag_1.posts_with_tag).to_not include(post_2)
      expect(tag_2.posts_with_tag).to_not include(post_2)
      expect(tag_3.posts_with_tag).to_not include(post_1)
    end

    it 'should not associated tags with the unpublished post' do
      expect(tag_2.posts_with_tag).to_not include(unpublished_post)
    end
  end

  describe '#frequency' do
    before do
      post_1.tags << [tag_1, tag_2]
      post_2.tags << [tag_3]
      unpublished_post.tags << [tag_2]
    end

    it 'should display the correct frequency for each tag' do
      expect(tag_1.frequency).to eql(1)
      expect(tag_2.frequency).to eql(1)   # does not the include the unpublished post
      expect(tag_3.frequency).to eql(1)
    end
  end

  # class methods
  describe '.with_posts scope' do
    before do
      post_1.tags << [tag_1]
      post_2.tags << []
      unpublished_post.tags << [tag_3]
    end

    it 'return tags that are associated with published posts' do
      expect(Tag.with_posts).to include(tag_1)
    end

    it 'should not return tags that are not associated with published posts' do
      expect(Tag.with_posts).to_not include(tag_2)
    end

    it 'should not return tags that are associated with unpublished posts' do
      expect(Tag.with_posts).to_not include(tag_3)
    end
  end

end
