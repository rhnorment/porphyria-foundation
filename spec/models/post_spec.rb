require 'rails_helper'

describe Post, type: :model do 
	let(:resource_class) { 'Post' }
	let(:all_resources) { ActiveAdmin.application.namespaces[:admin].resources }
	let(:resource) { all_resources[resource_class] }

	it 'has a valid resource name'

	it 'should display in the menu bar'

	it 'has the default set of CRUD actions available to it'

	it 'has a valid factory'

	it { should have_db_column(:admin_user_id).ot_type(:integer) }
	it { should have_db_column(:author).of_type(:string) }
	it { should have_db_column(:body).of_type(:text) }
	it { should have_db_column(:image).of_type(:string) }
	it { should have_db_column(:published).of_type(:boolean) }
	it { should have_db_column(:published_at).of_type(:datetime) }
	it { should have_db_column(:title).of_type(:string) }

	it { validate_presence_of(:admin_user_id) }
	it { validate_presence_of(:body) }
	it { validate_presence_of(:title) }

	it 'should create permalink (url) autmoatically with title and year if non is provided'

	it 'should not allow a post with a url starting with /'

	it 'should validate urls are unique to a post'

end

