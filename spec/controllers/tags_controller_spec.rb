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

  let!(:post_1)   { create(:published_post, title: 'Post 1 Title', published_at: Date.parse('10-10-10')) }
  let!(:post_2)   { create(:published_post, title: 'Post 2 Title', published_at: Date.parse('11-11-11')) }
  let!(:post_3)   { create(:unpublished_post) }
  let!(:tag_1)   { create(:tag, name: 'Tag 1') }
  let!(:tag_2)   { create(:tag, name: 'Tag 2') }

  describe 'GET :show' do
    before do
      post_1.tags.push(tag_1)
      post_3.tags.push(tag_1)

      get :show, id: tag_1
    end

    it { should route(:get, '/tags/1-tag-1').to(action: :show, id: tag_1) }
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
      expect(assigns(:posts)).to_not include(post_3)
    end

    it_behaves_like 'set tags'

    it_behaves_like 'set post archive dates'
  end

end
