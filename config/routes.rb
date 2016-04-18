Rails.application.routes.draw do

  root  'pages#home'

  get   '/404' => 'errors#not_found', as: 'not_found'
  get   '/422' => 'errors#unprocessable'
  get   '/500' => 'errors#server_error'

  resources   :posts, only: [:index, :show], path: '/blog'
  resources   :tags,  only: [:show]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

end
