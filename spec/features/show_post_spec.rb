require 'rails_helper'

describe 'view post', type: :feature do
  let!(:admin_user) { create(:admin_user) }
  let!(:post)       { create(:published_post, admin_user_id: admin_user.id) }

  before { visit post_path(post) }

  it 'should show the appropriate post attributes' do
    expect(page).to have_selector('div.media')

    expect(page).to have_text(post.title)
    expect(page).to have_text(post.admin_user.name)
    expect(page).to have_text(post.published_at.to_date)
    expect(page).to have_text(post.intro)
    expect(page).to have_text(post.body)
  end

  it 'should render the sidebar' do
    expect(page).to have_link('News')
    expect(page).to have_link('Blog')
    expect(page).to have_link('Member Stories')
    expect(page).to have_link('Get Involved')

    expect(page).to have_field('search')

    expect(page).to have_text('Tags')
  end



end