ActiveAdmin.register Post do

  menu  priority: 5


  # FORM ==========================================================
  form do |f|
    f.semantic_errors

    f.inputs do
      f.input   :author
      f.input   :title
      f.input   :post_url, label: 'Post URL'
      f.input   :body, as: :html_editor, label: 'Content'
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
      row   :post_url
      row   :body do
        raw(post.body)
      end
      row   :image do
        cl_image_tag(post.image, width: 800, height: 600)
      end
    end
  end


  # PRIVATE =======================================================
  permit_params   :author, :body, :image, :post_url, :published, :published_at, :title

end
