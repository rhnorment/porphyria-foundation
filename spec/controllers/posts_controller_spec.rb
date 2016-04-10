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

  let(:published_post) { create(:published_post) }
  let(:unpublished_post) { create(:unpublished_post) }
  let(:tag1) { create(:tag, name: 'Tag 1') }
  let(:tag2) { create(:tag, name: 'Tag 2') }

  describe 'GET :index' do
    before { get :index }

    it { should route(:get, '/blog').to(action: :index) }
    it { should respond_with(:success) }
    it { should render_with_layout(:application) }
    it { should render_template(:index) }

    it 'should set @posts to include the published post' do
      expect(assigns(:posts)).to include(published_post)
    end

    it 'should not set @posts to include the unpublished post' do
      expect(assigns(:posts)).to_not include(unpublished_post)
    end

    it 'should set @tags to include all tags' do
      expect(assigns(:tags)).to include(tag1, tag2)
    end
  end

  describe 'GET :show' do
    context 'post is published' do
      before { get :show, id: published_post }

      it { should route(:get, '/blog/1-published-post-title').to(action: :show, id: published_post) }
      it { should respond_with(:success) }
      it { should render_with_layout(:application) }
      it { should render_template(:show) }
    end

    context 'post is not published' do
      before { get :show, id: unpublished_post }

      it { should_not route(:get, 'blog/2-unpublished-post-title').to(action: :show, id: unpublished_post) }
      it { should redirect_to(posts_url) }
    end
  end

end
