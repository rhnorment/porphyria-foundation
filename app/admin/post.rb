ActiveAdmin.register Post do

  # set date for future posts
  # date and time  - 2

  # add signature section  -1

  # add image to content section  -3

  # article can be news blog member story

  # search -- 4

  # add upcmong events to Categories  -5

  config.sort_order = 'published_at_desc'

  filter    :admin_user
  filter    :title
  filter    :body
  filter    :published
  filter    :published_at

  form do |f|
    f.semantic_errors

    f.inputs do
      f.input :admin_user, as: :select, collection: AdminUser.all, prompt: 'Select one'
      f.input :title
      f.input :body, as: :html_editor, label: 'Content'
      f.input :image, as: :file, hint: cl_image_tag(post.image_url)
      f.input :image_cache, as: :hidden
      li link_to 'Remove Image', remove_image_admin_post_path(post), method: :put if post.image?
      f.input :tag_list
      f.input :published_at, as: :datetime_select, label: 'Publish On',  discard_minute: true, order: [:month, :day, :year]
    end

    f.actions
  end

  index do
    selectable_column
    column('Title') { |post| link_to post.title, admin_post_path(post) }
    column('Author') { |post| post.admin_user.name }
    column('Tags') { |post| post.tags.size }
    column('Published?') { |post| status_tag(post.published) }
    column  :published_at
    actions
  end

  menu parent: 'Site Content'

  scope   :all, default: true
  scope   :published
  scope   :unpublished

  show do
    attributes_table do
      row :title
      row('Author') { |post| post.admin_user.name }
      row :slug
      row :body do
        raw(post.body)
      end
      row :image do
        post.image.blank? ? 'No image to display' : cl_image_tag(post.image_url)
      end
      row('Tag List') { |post| (post.tag_list) }
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

  action_item :publish_post_now, only: :show do
    link_to 'Publish post', publish_admin_post_path(post), method: :put if post.is_not_published?
  end

  action_item :unpublish_post, only: :show do
    link_to 'Unublish post', unpublish_admin_post_path(post), method: :put  if post.is_published?
  end

  permit_params   :admin_user_id,
                  :body,
                  :image,
                  :intro,
                  :published,
                  :published_at,
                  :title,
                  :image_cache,
                  :tag_list

end
