require 'rails_helper'

describe 'list tag posts', type: :feature do

  let!(:admin_user) { create(:admin_user) }
  let!(:post_1)   { create(:published_post, admin_user: admin_user, title: 'Post 1 Title', published_at: Date.parse('10-10-10')) }
  let!(:post_2)   { create(:published_post, title: 'Post 2 Title', published_at: Date.parse('11-11-11')) }
  let!(:post_3)   { create(:unpublished_post) }
  let!(:tag_1)    { create(:tag, name: 'Tag 1') }
  let!(:tag_2)    { create(:tag, name: 'Tag 2') }

  before do
    post_1.tags.push(tag_1)
    post_1.tags.push(tag_2)
    post_3.tags.push(tag_1)

    visit tag_path(tag_1)
  end

  it 'contains the correct attributes for the correct posts' do
    expect(page).to have_text('Showing posts for Tag 1')

    expect(page).to have_selector('div.media')

    expect(page).to have_text(post_1.title)
    expect(page).to have_text(post_1.admin_user.name)
    expect(page).to have_text(post_1.published_at.to_date)
    expect(page).to have_text(post_1.body)

    expect(page).to have_link('Read more')
  end

  it 'should link to the appropriate post view' do
    click_link('Read more')

    expect(have_current_path(post_1))
  end

  it 'does not contain attributes for non-associated posts' do
    expect(page).to_not have_text(post_2.title)
  end

  it 'does not contain attributes for unpublished posts' do
    expect(page).to_not have_text(post_3.title)
  end

  it_behaves_like 'blog sidebar'

end