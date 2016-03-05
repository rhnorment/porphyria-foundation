# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  author       :string           default("")
#  body         :text             default("")
#  image        :string           default("")
#  slug         :string           default("")
#  published    :boolean          default(FALSE)
#  published_at :datetime
#  title        :string           default("")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:unpublished_post) { create(:post) }
  let(:published_post) { create(:published_post) }

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
  end

  describe 'GET :show' do
    context 'post is published' do
      before { get :show, id: published_post }

      it { should route(:get, '/blog/1').to(action: :show, id: published_post) }
      it { should respond_with(:success) }
      it { should render_with_layout(:application) }
      it { should render_template(:show) }
    end

    context 'post is not published' do
      before { get :show, id: unpublished_post }

      it { should_not route(:get, 'blog/2').to(action: :show, id: unpublished_post) }
      it { should redirect_to(posts_url) }
    end
  end

end
