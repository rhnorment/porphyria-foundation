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

shared_examples_for 'rendered post' do

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


