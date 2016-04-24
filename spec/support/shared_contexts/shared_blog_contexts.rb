shared_context 'set tags' do
  it 'should set @tags to include only tags with associated posts' do
    expect(assigns(:tags)).to include(tag_1)
    expect(assigns(:tags)).to_not include(tag_2)
  end
end

shared_context 'set post archive'

shared_context 'blog sidebar' do
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

  it 'should render the published posts grouped by month'

  it 'should not list umpublished posts'
end