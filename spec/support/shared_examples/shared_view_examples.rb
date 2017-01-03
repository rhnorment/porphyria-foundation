shared_examples 'title' do
  it { expect(page).to have_title('American Porphyria Foundation') }
end

shared_examples 'logo' do
  it { within 'a.logo' do
        expect(page).to have_selector('img')
      end
  }
end

shared_examples 'mobile menu toggle' do
  it { expect(page).to have_link('MENU', href: '') }
end

shared_examples 'footer' do
  it { within 'footer.footer' do
        expect(page).to have_css('p.copyright')

        expect(page).to have_css('i.fa.fa-facebook')
        expect(page).to have_css('i.fa.fa-twitter')
        expect(page).to have_css('i.fa.fa-youtube')
        expect(page).to have_css('i.fa.fa-instagram')
      end
  }
end

def it_behaves_like_layout
  it_behaves_like 'title'
  it_behaves_like 'logo'
  it_behaves_like 'mobile menu toggle'
  it_behaves_like 'footer'
end


