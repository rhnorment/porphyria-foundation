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

    it_should_behave_like_layout

    describe 'sidebar' do
      it 'should contain a sub-menu' do
        within 'aside.sidebar' do
          expect(page).to have_css('h4', text: 'Categories')
          expect(page).to have_link('Blog', href: '/blog')
        end
      end

      it 'should have a link to NEWS'
      it 'should have a link to MEMBER STORIES'
      it 'should have a link to GET INVOLVED'

      it 'should contain a search widget'

      it 'should contain a tags widget' do
        within 'aside.sidebar' do
          expect(page).to have_css('h4', text: 'Tags')

          expect(page).to have_link('Tag Name One (1)')
          expect(page).to have_link('Tag Name Three (1)')

          expect(page).not_to have_link('Tag Name Two')
        end
      end

      it 'should contain an Archives widget' do
        within 'aside.sidebar' do
          expect(page).to have_css('h4', text: 'Archives')

          expect(page).to have_link('November 2011', href: '/blog?date_month=November+2011')
          expect(page).to have_link('October 2010', href: '/blog?date_month=October+2010')
        end
      end
    end
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
      save_and_open_page

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
