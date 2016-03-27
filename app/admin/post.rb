ActiveAdmin.register Post do

  menu  priority: 4


  # FORM ==========================================================
  form do |f|
    f.semantic_errors

    f.inputs do
      f.input :author
      f.input :title
      f.input :body, label: 'Content'
      f.input :image, as: :file, hint: cl_image_tag(post.image_url)
      f.input :image_cache, as: :hidden
      li link_to 'Remove Image', remove_image_admin_post_path(post), method: :put if post.image?
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
    column  :published_at
    actions
  end

  scope   :all, default: true
  scope   :published
  scope   :unpublished

  # SHOW ==========================================================
  show do
    attributes_table do
      row :title
      row :author
      row :slug
      row :body do
        raw(post.body)
      end
      row :image do
        post.image.blank? ? 'No image to display' : cl_image_tag(post.image_url)
      end
      row('Published?') { |post| status_tag(post.published) }
      row :published_at
    end
  end


  # PRIVATE =======================================================
  member_action :publish, method: :put do
    resource.publish
    redirect_to admin_post_path(resource), notice: 'This post was successfully published!!'
  end

  member_action :remove_image, method: :put do
    resource.remove_image!
    resource.save
    redirect_to admin_post_path(resource)
  end

  member_action :unpublish, method: :put do
    resource.unpublish
    redirect_to admin_post_path(resource), alert: 'This post was unpublished.'
  end

  action_item :view, only: :show do
    link_to 'View on site', post_path(post) if post.is_published?
  end

  action_item :publish_post, only: :show do
    link_to 'Publish post', publish_admin_post_path(post), method: :put if post.is_not_published?
  end

  action_item :unpublish_post, only: :show do
    link_to 'Unublish post', unpublish_admin_post_path(post), method: :put  if post.is_published?
  end

  permit_params   :author, :body, :image, :post_url, :published, :published_at, :title, :image_cache

end
