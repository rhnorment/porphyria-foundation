require 'rails_helper'

RSpec.describe 'view posts index', type: :feature do
  include_context 'admin users'
  include_context 'posts'
  include_context 'tags'

  before :each do
    tag_posts
  end

  describe 'view attributes' do
    before { visit posts_url }

    it 'should print html' do
      # save_and_open_page
    end

    it_should_behave_like_layout_in_waiting

    it_should_behave_like_sidebar
  end

  describe 'view all posts' do
    before { visit posts_url }

    it 'should display all published posts' do
      expect(page).to have_link('Archive')
      expect(page).to have_text('November 2011')

      expect(page).to have_link('Archive Two')
      expect(page).to have_text('October 2010')
    end

    it 'should not display unpublished posts' do
      expect(page).to_not have_link('Not Archive')
    end
  end

  describe 'view all posts scoped to a tag' do
    before do
      visit posts_url

      click_link('Tag Name One (1)')
    end

    it 'should only render posts scoped to the selected tag' do
      expect(page).to have_css('h5', text: 'Showing posts for Tag Name One')

      expect(page).to have_link('Archive')

      expect(page).not_to have_link('Archive Two')
    end
  end

  describe 'view all posts scoped to a month' do
    before do
      visit posts_url

      click_link('October 2010')
    end

    it 'should only render posts scoped to the selected date-month' do
      expect(page).to have_css('h5', text: 'Showing posts for October 2010')

      expect(page).to have_link('Archive')

      expect(page).not_to have_link('Archive Two')
    end
  end
end
