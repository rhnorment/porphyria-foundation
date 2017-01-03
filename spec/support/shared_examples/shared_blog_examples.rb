shared_examples 'set tags' do
  it { expect(assigns(:tags)).to include(tag_1) }
  it { expect(assigns(:tags)).to_not include(tag_2) }
end

shared_examples 'set post archive dates' do
  it { expect(assigns(:dates)).to eql(["November 2011", "October 2010"]) }
end

shared_examples 'display published posts' do
  it { expect(page).to have_link('Archive') }
  it { expect(page).to have_link('Archive Two') }
end

shared_examples 'do not display unpublished posts' do
  it { expect(page).to_not have_text('Not Archive') }
end

shared_examples 'display post details'


