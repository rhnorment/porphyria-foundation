require 'rails_helper'

describe 'list posts', type: :feature do

  let!(:admin_user) { create(:admin_user) }
  let!(:post) { create(:published_post, admin_user_id: admin_user.id) }
  let!(:tag1) { create(:tag, name: 'Tag 1') }
  let!(:tag2) { create(:tag, name: 'Tag 2') }
  let!(:tag3) { create(:tag, name: 'Tag 3') }

  before { visit posts_url }

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

  it 'should render the sidebar headers' do
    expect(page).to have_link('News')
    expect(page).to have_link('Blog')
    expect(page).to have_link('Member Stories')
    expect(page).to have_link('Get Involved')

    expect(page).to have_field('search')

    expect(page).to have_text('Tags')
  end

  it 'should render the search form' do
    expect(page).to have_field('search')
  end

  it 'should render the list of active tags in the sidebar' do
    within('.blog-tags') do
      expect(page).to have_text('Tag 1')
      expect(page).to have_text('Tag 2')
      expect(page).to have_text('Tag 3')
    end
  end

end
