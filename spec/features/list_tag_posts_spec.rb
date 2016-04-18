require 'rails_helper'

describe 'list tag posts', type: :feature do

  let!(:admin_user) { create(:admin_user) }
  let!(:post_1) { create(:published_post, title: 'First Post', admin_user_id: admin_user.id) }
  let!(:post_2) { create(:published_post, title: 'Second Post', admin_user_id: admin_user.id) }
  let!(:post_3) { create(:unpublished_post, admin_user_id: admin_user.id) }

  let!(:tag_1)  { create(:tag, name: 'Tag 1') }

  before do
    post_1.tags.push(tag_1)
    post_3.tags.push(tag_1)

    visit tag_path(tag_1)
  end

  it 'contains the correct attributes for the correct posts' do
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

end