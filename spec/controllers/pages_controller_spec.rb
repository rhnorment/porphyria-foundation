require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  include_context 'posts'

  describe 'GET :home' do
    before { get :home }

    it { should route(:get, '/').to(action: :home) }
    it { should respond_with(:success) }
    it { should render_with_layout(:application) }
    it { should render_template(:home) }

    it 'should set @posts to include the published post' do
      expect(assigns(:posts)).to match_array([post_1, post_2])
    end

    it 'should not set @posts to include the unpublished post' do
      expect(assigns(:posts)).to_not include(unpublished_post)
    end
  end

end