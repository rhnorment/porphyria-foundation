require 'rails_helper'

describe 'blog sidebar', type: :feature do

  let!(:admin_user) { create(:admin_user) }
  let!(:post_1) { create(:published_post, title: 'First Post', admin_user: admin_user) }
  let!(:post_2) { create(:published_post, title: 'Second Post', admin_user: admin_user) }
  let!(:post_3) { create(:unpublished_post, title: 'Third Post', admin_user: admin_user) }

  let!(:tag_1)  { create(:tag, name: 'Tag 1') }
  let!(:tag_2)  { create(:tag, name: 'Tag 2') }
  let!(:tag_3)  { create(:tag, name: 'Tag 3') }

  before :each do
    post_1.tags.push(tag_1, tag_2)
    post_3.tags.push(tag_3)
  end


  context 'posts index view' do
    before { visit posts_url }

    it_behaves_like 'blog sidebar'
  end

  context 'post view' do
    before { visit post_url(post_1) }

    it_behaves_like 'blog sidebar'
  end

  context 'tag view' do
    before { visit tag_url(tag_1) }

    it_behaves_like 'blog sidebar'
  end

end
