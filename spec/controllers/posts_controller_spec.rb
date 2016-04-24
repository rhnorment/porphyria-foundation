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

require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let!(:post_1)   { create(:published_post, title: 'Post 1 Title') }
  let!(:post_2)   { create(:published_post, title: 'Post 2 Title') }
  let!(:post_3)   { create(:unpublished_post) }
  let!(:tag_1)    { create(:tag, name: 'Tag 1') }
  let!(:tag_2)    { create(:tag, name: 'Tag 2') }

  before :each do
    post_1.tags.push(tag_1)
  end

  describe 'GET :index' do
    before { get :index }

    it { should route(:get, '/blog').to(action: :index) }
    it { should respond_with(:success) }
    it { should render_with_layout(:application) }
    it { should render_template(:index) }

    it 'should set @posts to include the published post' do
      expect(assigns(:posts)).to include(post_1, post_2)
    end

    it 'should not set @posts to include the unpublished post' do
      expect(assigns(:posts)).to_not include(post_3)
    end

    it_behaves_like 'set tags'
  end

  describe 'GET :show' do
    context 'post is published' do
      before { get :show, id: post_1 }

      it { should route(:get, '/blog/1-post-1-title').to(action: :show, id: post_1) }
      it { should respond_with(:success) }
      it { should render_with_layout(:application) }
      it { should render_template(:show) }

      it_behaves_like 'set tags'
    end

    context 'post is not published' do
      before { get :show, id: post_3 }

      it { should_not route(:get, 'blog/2-post-3-title').to(action: :show, id: post_3) }
      it { should redirect_to(posts_url) }
    end
  end

end
