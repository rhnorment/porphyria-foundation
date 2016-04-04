ActiveAdmin.register AdminUser do

  menu priority: 2

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs 'Admin Details' do
      f.input :name
      f.input :email
      f.input :bio
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column 'Email' do |admin_user|
      link_to admin_user.email, admin_admin_user_path(admin_user)
    end
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  menu priority: 4

  permit_params :bio, :email, :name, :password, :password_confirmation

  show do
    attributes_table do
      row   :name
      row   :email
      row   :bio
      row   :current_sign_in_at
      row   :sign_in_count
      row   :created_at
    end
  end

end
