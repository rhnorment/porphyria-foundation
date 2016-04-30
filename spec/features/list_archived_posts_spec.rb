require 'rails_helper'

describe 'list posts', type: :feature do

  let!(:admin_user) { create(:admin_user) }
  let!(:post_1)   { create(:published_post, admin_user: admin_user, title: 'Post 1 Title', published_at: Date.parse('10-10-10')) }
  let!(:post_2)   { create(:published_post, title: 'Post 2 Title', published_at: Date.parse('11-11-11')) }
  let!(:post_3)   { create(:unpublished_post) }
  let!(:tag_1)    { create(:tag, name: 'Tag 1') }
  let!(:tag_2)    { create(:tag, name: 'Tag 2') }

  before do
    post_1.tags.push(tag_1)
    post_1.tags.push(tag_2)
    visit posts_url
    click_link('October 2010')
  end

  it 'contains the correct attributes and link' do
    expect(page).to have_text('Showing posts for October 2010')

    within("div##{post_1.id}") do
      expect(page).to have_selector('div.media')

      expect(page).to have_text(post_1.title)
      expect(page).to have_text(post_1.admin_user.name)
      expect(page).to have_text(post_1.published_at.to_date)
      expect(page).to have_text(post_1.body)

      expect(page).to have_link('Read more')
    end
  end

  it 'should link to the appropriate post view' do
    within("div##{post_1.id}") do
      click_link('Read more')

      expect(have_current_path(post_1))
    end
  end

  it_behaves_like 'blog sidebar'

end
