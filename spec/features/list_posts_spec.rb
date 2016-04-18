require 'rails_helper'

describe 'list posts', type: :feature do

  let!(:admin_user) { create(:admin_user) }
  let!(:post) { create(:published_post, admin_user_id: admin_user.id) }

  before do
    visit posts_url
  end

  it 'contains the correct attributes and link' do
    within("div##{post.id}") do
      expect(page).to have_selector('div.media')

      expect(page).to have_text(post.title)
      expect(page).to have_text(post.admin_user.name)
      expect(page).to have_text(post.published_at.to_date)
      expect(page).to have_text(post.body)

      expect(page).to have_link('Read more')
    end
  end

  it 'should link to the appropriate post view' do
    within("div##{post.id}") do
      click_link('Read more')

      expect(have_current_path(post))
    end
  end

end
