require 'rails_helper'

RSpec.describe 'view post', type: :feature do

  include_context 'admin users'
  include_context 'posts'
  include_context 'tags'

  before :each do
    tag_posts
  end

  describe 'static post attributes' do
    before do
      visit posts_url
      click_link('Archive')
    end

    it 'should print html' do
      #save_and_open_page
    end

    it_should_behave_like_layout_in_waiting

    it_should_behave_like_sidebar
  end

  describe 'post attributes' do
    before do
      visit posts_url
      click_link('Archive')
    end

    it 'should display the correct header image'

    it 'should display the correct title' do
      within('div.title') do
        expect(page).to have_css('h2', text: 'Archive')
      end
    end

    it 'should display the correct body' do
      expect(page).to have_css('p', text: 'This is the body of the example post.')
    end

    it 'should display the correct intro' do
      expect(page).to have_css('p', text: 'This is the intro to the post.')
    end

    it 'should display the correct metadata' do
      within('div.meta') do
        expect(page).to have_css('span', text: 'Admin User')
        expect(page).to have_css('span', text: 'October 10, 2010')
      end
    end

    it 'should display the correct closing content' do
      expect(page).to have_css('h3', text: 'Research...Is your Key to a Cure')
    end
  end
end

