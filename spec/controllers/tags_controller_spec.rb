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

RSpec.describe TagsController, type: :controller do

  include_context 'posts'
  include_context 'tags'

  describe 'GET :show' do
    before do
      tag_posts

      get :show, params: { id: tag_1 }
    end

    it { should route(:get, '/tags/1-tag-name-one').to(action: :show, id: tag_1) }
    it { should respond_with(:success) }
    it { should render_with_layout(:application) }
    it { should render_template(:show) }

    it 'assigns the posts associated with the tag' do
      expect(assigns(:posts)).to include(post_1)
    end

    it 'does not assign posts not associated with the tag' do
      expect(assigns(:posts)).to_not include(post_2)
    end

    it 'does not assign unpublished posts' do
      expect(assigns(:posts)).to_not include(unpublished_post)
    end

    it_behaves_like 'set tags'

    it_behaves_like 'set post archive dates'
  end

end
