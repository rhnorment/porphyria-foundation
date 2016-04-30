ActiveAdmin.register Tag do

  menu  priority: 5

  # INDEX ==========================================================
  config.sort_order = 'frequency_desc'

  filter    :name
  filter    :posts
  filter    :created_at
  filter    :updated_at

  index do
    selectable_column
    column('Name') { |tag| link_to tag.name, admin_tag_path(tag) }
    column  :frequency
  end


  # SHOW ===========================================================
  show do
    attributes_table do
      row   :name
      row   :frequency
      row   :created_at
      row   :updated_at
    end

    panel 'Posts with Tag' do
      table_for tag.posts do
        column('Title') { |post| link_to post.title, admin_post_path(post) }
      end
    end
  end

  #  PRIVATE =======================================================
  permit_params   :name

end
