require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:unpublished_post) { create(:post) }
  let(:published_post) { create(:published_post) }

  describe 'GET :index' do
    before { get :index }

    it { should route(:get, '/posts').to(action: :index) }
    it { should respond_with(:success) }
    it { should render_with_layout(:application) }
    it { should render_template(:index) }

    it 'should set @posts to include the published post' do
      expect(assigns(:posts)).to include(published_post)
    end

    it 'should not set @posts to include the unpublished post' do
      expect(assigns(:posts)).to_not include(unpublished_post)
    end
  end

  describe 'GET :show' do
    context 'post is published' do
      before { get :show, id: published_post.id }

      it { should route(:get, '/posts/1').to(action: :show, id: published_post.id) }
      it { should respond_with(:success) }
      it { should render_with_layout(:application) }
      it { should render_template(:show) }
    end

    context 'post is not published' do
      before { get :show, id: unpublished_post.id }

      it { should_not route(:get, '/posts/2').to(action: :show, id: unpublished_post.id) }
      it { should redirect_to(controller: :errors, action: :not_found) }
    end
  end
  
end
