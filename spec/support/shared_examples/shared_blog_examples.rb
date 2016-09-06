shared_examples 'set tags' do
  it { expect(assigns(:tags)).to include(tag_1) }
  it { expect(assigns(:tags)).to_not include(tag_2) }
end

shared_examples 'set post archive dates' do
  it { expect(assigns(:dates)).to eql(["November 2011", "October 2010"]) }
end


