require 'rails_helper'

describe 'view home page', type: :feature do

  let!(:admin_user)         { create(:admin_user) }
  let!(:post)               { create(:published_post, admin_user: admin_user) }
  let!(:post_without_image) { create(:post_without_image, admin_user: admin_user) }

  before { visit root_url }

  context 'the post contains a primary image' do
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
   end

  context 'the post does not contain a primary image' do
    it 'contains the correct attributes and link' do
      within("div##{post_without_image.id}") do
        expect(page).to have_selector('div.media')

        expect(page).to have_text(post_without_image.title)
        expect(page).to have_text(post_without_image.admin_user.name)
        expect(page).to have_text(post_without_image.published_at.to_date)
        expect(page).to have_text(post_without_image.body)

        expect(page).to have_link('Read more')
      end
    end
  end

  it 'displays a link to the post index view' do
    expect(page).to have_link('View all posts')
  end

end