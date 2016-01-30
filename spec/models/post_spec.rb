# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  author       :string           default("")
#  body         :text             default("")
#  image        :string           default("")
#  post_url     :string           default("")
#  published    :boolean          default(FALSE)
#  published_at :datetime
#  title        :string           default("")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Post, type: :model do

  it 'is valid with example attributes' do
    expect(Post.new(post_attributes)).to be_valid
  end

  it { should have_db_column(:author).of_type(:string) }
  it { should have_db_column(:body).of_type(:text) }
  it { should have_db_column(:image).of_type(:string) }
  it { should have_db_column(:post_url).of_type(:string) }
  it { should have_db_column(:published).of_type(:boolean) }
  it { should have_db_column(:published_at).of_type(:datetime) }
  it { should have_db_column(:title).of_type(:string) }

  it { should have_db_index(:post_url)}

  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:title) }
end
