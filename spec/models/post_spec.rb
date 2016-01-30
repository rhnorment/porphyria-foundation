require 'rails_helper'

describe Post, type: :model do 
	let(:resource_class) { 'Post' }
	let(:all_resources) { ActiveAdmin.application.namespaces[:admin].resources }
	let(:resource) { all_resources[resource_class] }

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
	end

	it { should belong_to(Admin::admin_user) }

	it { should have_db_column(:admin_user_id).of_type(:integer) }
	it { should have_db_column(:body).of_type(:text) }
	it { should have_db_column(:image).of_type(:string) }
	it { should have_db_column(:published).of_type(:boolean) }
	it { should have_db_column(:published_at).of_type(:datetime) }
	it { should have_db_column(:title).of_type(:string) }

	it { should validate_presence_of(:admin_user_id) }
	it { should validate_presence_of(:body) }
	it { should validate_presence_of(:title) }

	it 'should create permalink (url) automatically with title and year if none is provided'

	it 'should not allow a post with a url starting with /'

	it 'should validate urls are unique to a post'

end

