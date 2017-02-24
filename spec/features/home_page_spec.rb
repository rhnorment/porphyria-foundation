require 'rails_helper'

describe 'home page', type: :feature do

  before { visit root_url }

  it 'prints html' do
    # save_and_open_page
  end

  it_should_behave_like_layout

  it 'renders the main menu' do
    within 'nav.nav' do
      expect(page).to have_link('Home', href: '#section-intro')
      expect(page).to have_link('Site Features', href: '#section-features')
      expect(page).to have_link('APF Showcase', href: '#section-showcase')
      expect(page).to have_link('Blog', href: '#section-blog')
      expect(page).to have_link('Contact', href: '#section-contact')
    end
  end

  describe 'intro section' do
    it_should_behave_like 'parallax', 'intro'

    it 'should contain the correct logo' do
      within '#section-intro' do
        expect(page).to have_css('div.logo')
        expect(page).to have_selector('img')
      end
    end

    it 'should contain the mission statement' do
      within '#section-intro' do
        expect(page).to have_css('h3', text: 'The APF is dedicated to improving the health and well-being of individuals and families affected by Porphyria.')
      end
    end
  end

  describe 'features section' do
    it 'should have the correct section title' do
      within '#section-features' do
        expect(page).to have_css('h2', text: 'Get Involved')
        expect(page).to have_css('p', text: 'Welcome to our new site! Here are a few things you can do:')
      end
    end

    it 'should have the correct features, icons, and content' do
      within '#section-features' do
        # learn
        expect(page).to have_css('i.fa.fa-university')
        expect(page).to have_css('h4', text: 'Learn about Porphyria')
        expect(page).to have_css('p') # need content

        # diagnose
        expect(page).to have_css('i.fa.fa-stethoscope')
        expect(page).to have_css('h4', text: 'Diagnose Porphyria')
        expect(page).to have_css('p') # need content

        # treat
        expect(page).to have_css('i.fa.fa-medkit')
        expect(page).to have_css('h4', text: 'Treat Porphyria')
        expect(page).to have_css('p') # need content

        # join
        expect(page).to have_css('i.fa.fa-users')
        expect(page).to have_css('h4', text: 'Join the APF')
        expect(page).to have_css('p') # need content

        # donate
        expect(page).to have_css('i.fa.fa-credit-card')
        expect(page).to have_css('h4', text: 'Donate to the APF')
        expect(page).to have_css('p') # need content

        # forum
        expect(page).to have_css('i.fa.fa-support')
        expect(page).to have_css('h4', text: 'Visit our Forum')
        expect(page).to have_css('p') # need content
      end
    end
  end

  describe 'newsletter section' do
    it_should_behave_like 'parallax', 'newsletter'

    it 'should contain a call to action' do
      within '#section-newsletter' do
        expect(page).to have_css('p', 'Register for our monthly newsletter and receive
                                       notifications when important news about Porphyria occurs!')
      end
    end

    it 'should contain a newsletter subscription form' do
      within '#section-newsletter' do
        expect(page).to have_selector('form')
        expect(page).to have_field('email')
        expect(page).to have_button('Submit')
      end
    end

    describe 'newsletter form' do
      context 'valid subscription data' do
        it 'should create a new subscription and redirect to the newsletter index'
      end

      context 'invalid subsription data' do
        it 'should not create a new subscription and remain on the home page'
      end
    end

  end

  describe 'member showcase section' do
    it 'should contain section heading information' do
      within '#section-showcase' do
        expect(page).to have_css('h2', text: 'APF Showcase')
        expect(page).to have_css('p')  # need content
      end
    end

    it 'should have JOIN and DONATE calls to action' do
      within '#section-showcase' do
        expect(page).to have_link('Join APF')
        expect(page).to have_link('Donate')
      end
    end

    it 'should have at least 3 member story featurettes' do
      within '#section-showcase' do
        expect(page).to have_selector('img', minimum: 3)
      end
    end
  end

  describe 'video showcase section' do
    it 'should contain header information for the Dateline video' do
      within '#section-video-showcase' do
        expect(page).to have_css('h4', text: 'Dateline NBC: Out of the Shadows')
        expect(page).to have_css('p', 'Watch the full episode of EPP featured on Dateline NBC.')
      end
    end

    it 'should contain an iframe with the Dateline video' do
      within '#section-video-showcase' do
        expect(page).to have_selector('iframe')
      end
    end
  end

  describe 'advisory board section' do
    it 'should have header information for the advisory board' do
      within '#section-advisory-board' do
        expect(page).to have_css('h4', text: 'Scientific Advisory Board')
      end
    end

    it 'should contain an image of the advisory board' do
      within '#section-advisory-board' do
        expect(page).to have_selector('img')
      end
    end
  end

  describe 'quote section' do
    it_should_behave_like 'parallax', 'quote'

    it 'should contain at least 2 blockquotes' do
      within '#section-quote' do
        expect(page).to have_css('blockquote', minimum: 2)
        expect(page).to have_css('cite', minimum: 2)
      end
    end
  end

  describe 'blog section' do
    it 'should contain header information for the blogs' do
      within '#section-blog' do
        expect(page).to have_css('h2', text: 'Latest Blog Posts')
        expect(page).to have_css('p', text: 'Check back often for exciting news and announcements.')
      end
    end

    it 'should contain a link to the blog site' do
      within '#section-blog' do
        expect(page).to have_link('View all posts', href: '/blog')
      end
    end
  end

  describe 'contact section' do
    it 'should have header information inviting a contact' do
      within '#section-contact' do
        expect(page).to have_css('h2', text: 'Contact')
        expect(page).to have_css('p') # need content
      end
    end

    it 'should contain a contact form with contact fields and actions' do
      within '#section-contact' do
        expect(page).to have_field('name')
        expect(page).to have_field('email')
        expect(page).to have_field('phone')
        expect(page).to have_field('message')
        expect(page).to have_button('Submit')
      end
    end

    describe 'contact form' do
      context 'valid contact data' do
        it 'should create a new contact and remain on the home page'
      end

      context 'invalid form data' do
        it 'should not create a new contact and remain on the home page'
      end
    end
  end

end