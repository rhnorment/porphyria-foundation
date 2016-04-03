require 'rails_helper'

describe 'list posts', type: :feature do

  let!(:post) { create(:published_post) }
  let!(:post_without_image) { create(:post_without_image) }

  before { visit posts_url }

  context 'the post contains a primary image' do
    it 'contains the correct attributes and link' do
      within("div##{post.id}") do
        expect(page).to have_selector('div.media')

        expect(page).to have_text(post.title)
        expect(page).to have_text(post.author)
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
        expect(page).to have_text(post_without_image.author)
        expect(page).to have_text(post_without_image.published_at.to_date)
        expect(page).to have_text(post_without_image.body)

        expect(page).to have_link('Read more')
      end
    end
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
