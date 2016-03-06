ActiveAdmin.register Post do

  menu  priority: 5


  # FORM ==========================================================
  form do |f|
    f.semantic_errors

    f.inputs do
      f.input   :author
      f.input   :title
      f.input   :body, label: 'Content'
      f.input   :image, as: :file, label: 'Primary Image'
    end

    f.actions
  end


  # INDEX =========================================================
  config.sort_order = 'published_at_desc'

  filter    :author
  filter    :title
  filter    :body
  filter    :published
  filter    :published_at

  index do
    selectable_column
    column('Title') { |post| link_to post.title, admin_post_path(post) }
    column  :author
    column('Published?') { |post| status_tag(post.published) }
    column  :published_on
    actions
  end

  scope   :all, default: true
  scope   :published
  scope   :unpublished


  # SHOW ==========================================================
  show do
    attributes_table do
      row   :title
      row   :slug
      row   :body do
        raw(post.body)
      end
      row   :image do
        cl_image_tag(post.image, width: 800, height: 600)
      end
      row   :published
      row   :published_at
    end
  end


  # PRIVATE =======================================================
  action_item :view, only: :show do
    link_to 'View on site', post_path(post) if post.is_published?
  end

  action_item :publish_post, only: :show do
    link_to 'Publish post', '' if post.is_not_published?
  end

  action_item :unpublish_post, only: :show do
    link_to 'Publish post', '' if post.is_published?
  end

  permit_params   :author, :body, :image, :post_url, :published, :published_at, :title

end
