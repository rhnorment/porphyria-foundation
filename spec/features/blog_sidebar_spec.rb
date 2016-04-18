require 'rails_helper'

describe 'blog sidebar', type: :feature do

  let!(:admin_user) { create(:admin_user) }
  let!(:post_1) { create(:published_post, title: 'First Post', admin_user: admin_user) }
  let!(:post_2) { create(:published_post, title: 'Second Post', admin_user: admin_user) }
  let!(:post_3) { create(:unpublished_post, title: 'Third Post', admin_user: admin_user) }

  let!(:tag_1)  { create(:tag, name: 'Tag 1') }
  let!(:tag_2)  { create(:tag, name: 'Tag 2') }
  let!(:tag_3)  { create(:tag, name: 'Tag 3') }


  before do
    post_1.tags.push(tag_1, tag_2)
    post_3.tags.push(tag_3)

    visit posts_url
  end

  it 'should render the sidebar headers' do
    expect(page).to have_link('News')
    expect(page).to have_link('Blog')
    expect(page).to have_link('Member Stories')
    expect(page).to have_link('Get Involved')

    expect(page).to have_field('search')

    expect(page).to have_text('Tags')
    expect(page).to have_text('Archives')
  end

  it 'should render the search form' do
    expect(page).to have_field('search')
  end

  it 'should render the list of active tags in the sidebar with links to each tag index' do
    within('div.blog-tags') do
      expect(page).to have_link('Tag 1')
      expect(page).to have_link('Tag 2')
    end
  end

  it 'should not list tags without associated published posts' do
    within('div.blog-tags') do
      expect(page).to_not have_link('Tag 3')
    end
  end

  it 'should render the post archives'

end
