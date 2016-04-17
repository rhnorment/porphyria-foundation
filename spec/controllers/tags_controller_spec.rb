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

  let!(:post_1)   { create(:published_post, title: 'Post 1 Title') }
  let!(:post_2)   { create(:published_post, title: 'Post 2 Title') }
  let!(:post_3)   { create(:unpublished_post) }
  let!(:tag)      { create(:tag) }

  describe 'GET :show' do
    before do
      post_1.tags.push(tag)
      post_3.tags.push(tag)

      get :show, id: tag
    end

    it { should route(:get, '/tags/1-tag-name').to(action: :show, id: tag) }
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
  end

end
