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

  include_context 'posts'
  include_context 'tags'

  before :each do
    tag_posts
  end

  describe 'GET :index' do
    context 'params[:date_month] is nil' do
      before { get :index }

      it { should route(:get, '/blog').to(action: :index) }
      it { should respond_with(:success) }
      it { should render_with_layout(:application) }
      it { should render_template(:index) }

      it 'should set @posts to include the published post' do
        expect(assigns(:posts)).to include(post_1, post_2)
      end

      it 'should not set @posts to include the unpublished post' do
        expect(assigns(:posts)).to_not include(unpublished_post)
      end

      it_behaves_like 'set tags'

      it_behaves_like 'set post archive dates'
    end

    context 'params[:date_month] is not nil' do
      before { get :index, params: { date_month: 'October 2010' } }

      it { should route(:get, '/blog').to(action: :index) }
      it { should respond_with(:success) }
      it { should render_with_layout(:application) }
      it { should render_template(:index) }

      it 'should set @posts to include the published post' do
        expect(assigns(:posts)).to include(post_1)
      end

      it 'should not not set posts to include posts not within the date_month range' do
        expect(assigns(:posts)).to_not include(post_2)
      end

      it 'should not set @posts to include the unpublished post' do
        expect(assigns(:posts)).to_not include(unpublished_post)
      end

      it_behaves_like 'set tags'

      it_behaves_like 'set post archive dates'
    end
  end

  describe 'GET :show' do
    context 'post is published' do
      before { get :show, params: { id: post_1 } }

      it { should route(:get, '/blog/1-archive').to(action: :show, id: post_1) }
      it { should respond_with(:success) }
      it { should render_with_layout(:application) }
      it { should render_template(:show) }

      it_behaves_like 'set tags'

      it_behaves_like 'set post archive dates'
    end

    context 'post is not published' do
      before { get :show, params: { id: unpublished_post } }

      it { should_not route(:get, 'blog/2-not-archive').to(action: :show, id: unpublished_post) }
      it { should redirect_to(posts_url) }
    end
  end

end
