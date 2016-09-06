shared_context 'posts' do
  let!(:post_1)             { Post.create(post_attributes(title: 'Archive', published_at: Date.parse('10-10-10'))) }
  let!(:post_2)             { Post.create(post_attributes(title: 'Archive Two', published_at: Date.parse('11-11-11'))) }
  let!(:unpublished_post)   { Post.create(post_attributes(published: false, title: 'Not Archive')) }
end

shared_context 'tags' do
  let!(:tag_1)              { Tag.create(tag_attributes(name: 'Tag Name One')) }
  let!(:tag_2)              { Tag.create(tag_attributes(name: 'Tag Name Two')) }
  let!(:tag_3)              { Tag.create(tag_attributes(name: 'Tag Name Three')) }
end

def tag_posts
  post_1.tags.push([tag_1])
  post_2.tags.push([tag_3])
  unpublished_post.tags.push([tag_2])
end