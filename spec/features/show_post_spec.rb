require 'rails_helper'

describe 'view post', type: :feature do
  let!(:admin_user) { create(:admin_user) }
  let!(:post)       { create(:published_post, admin_user_id: admin_user.id) }
  let!(:tag1) { create(:tag, name: 'Tag 1') }
  let!(:tag2) { create(:tag, name: 'Tag 2') }
  let!(:tag3) { create(:tag, name: 'Tag 3') }

  before do
    post.tag_list = 'Tag 1, Tag 2'
    post.save
    post.reload
    visit post_path(post)
  end

  it 'should show the appropriate post attributes' do
    expect(page).to have_selector('div.media')

    expect(page).to have_text(post.title)
    expect(page).to have_text(post.admin_user.name)
    expect(page).to have_text(post.published_at.to_date)
    expect(page).to have_text(post.intro)
    expect(page).to have_text(post.body)
  end

  it 'should show the pasts associated tags' do
    within('div.post-tags') do
      expect(page).to have_link('Tag 1')
      expect(page).to have_link('Tag 2')
    end
  end

  it 'should not show the tags not associaed with the post' do
    within('div.post-tags') do
      expect(page).to_not have_link('Tag 3')
    end
  end

end