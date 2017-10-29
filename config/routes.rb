Rails.application.routes.draw do

<<<<<<< HEAD
  root  'pages#home'

  # get   'search',  to:  'search#search'
=======
  root to: 'admin/dashboard#index'
>>>>>>> release/3.1.1

  get   '/404' => 'errors#not_found', as: 'not_found'
  get   '/422' => 'errors#unprocessable'
  get   '/500' => 'errors#server_error'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

end
