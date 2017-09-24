shared_examples_for 'title' do
  it { expect(page).to have_title('American Porphyria Foundation') }
end

shared_examples_for 'logo' do
  it { within 'a.logo' do
        expect(page).to have_selector('img')
      end
  }
end

shared_examples_for 'mobile menu toggle' do
  it { expect(page).to have_link('MENU', href: '') }
end

shared_examples_for 'footer' do
  it { within 'footer.footer' do
        expect(page).to have_css('p.copyright')

        expect(page).to have_css('i.fa.fa-facebook')
        expect(page).to have_css('i.fa.fa-twitter')
        expect(page).to have_css('i.fa.fa-youtube')
        expect(page).to have_css('i.fa.fa-instagram')
      end
  }
end

shared_examples_for 'parallax' do |section|
  it { within "#section-#{section}" do
        expect(page).to have_css('div.image-bg')
        expect(page).to have_css('div.color-overlay')
    end
  }
end

shared_examples_for 'sub-menu' do
  it {
    within 'aside.sidebar' do
      expect(page).to have_css('h4', text: 'Categories')
      expect(page).to have_link('Blog', href: '/blog')
    end
  }
end

shared_examples_for 'tags-widget' do
  it {
    within 'aside.sidebar' do
      expect(page).to have_css('h4', text: 'Tags')

      expect(page).to have_link('Tag Name One (1)')
      expect(page).to have_link('Tag Name Three (1)')

      expect(page).not_to have_link('Tag Name Two')
    end
  }
end

shared_examples_for 'archives-widget' do
  it {
    within 'aside.sidebar' do
      expect(page).to have_css('h4', text: 'Archives')

      expect(page).to have_link('November 2011', href: '/blog?date_month=November+2011')
      expect(page).to have_link('October 2010', href: '/blog?date_month=October+2010')
    end
  }
end

def it_should_behave_like_layout
  it_should_behave_like 'title'
  it_should_behave_like 'logo'
  it_should_behave_like 'mobile menu toggle'
  it_should_behave_like 'footer'
end

def it_should_behave_like_layout_in_waiting
  it_should_behave_like 'footer'
end

def it_should_behave_like_sidebar
  it_should_behave_like 'sub-menu'
  it_should_behave_like 'tags-widget'
  it_should_behave_like 'archives-widget'
end

