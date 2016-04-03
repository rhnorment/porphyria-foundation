require 'rails_helper'

describe 'list postse', type: :feature do

  let!(:post) { create(:published_post) }
  let!(:post_without_image) { create(:post_without_image) }

  before { visit posts_url }

  context 'the post contains a primary image' do
    it 'contains the correct attributes and link' do

      print page.html
    end
  end

  context 'the post does not contain a primary image'

end