ActiveAdmin.register Tag do

  filter    :name
  filter    :posts
  filter    :created_at
  filter    :updated_at

  form do |f|
    f.semantic_errors

    f.inputs do
      f.input :name
    end

    f.actions
  end

  index do
    selectable_column
    column('Name')      { |tag| link_to tag.name, admin_tag_path(tag) }
    column('Frequency') { |tag| tag.frequency }
  end

  menu  priority: 4

  show do
    attributes_table do
      row   :name
      row('Frequency')  { |tag| tag.frequency }
      row   :created_at
      row   :updated_at
    end

    panel 'Posts with Tag' do
      table_for tag.posts.published do
        column('Title') { |post| link_to post.title, admin_post_path(post) }
      end
    end
  end

  permit_params   :name

end
