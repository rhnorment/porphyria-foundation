Rails.application.routes.draw do

  root to: 'admin/dashboard#index'

  resources :constant_contacts, only: [:index]

  get   '/404' => 'errors#not_found', as: 'not_found'
  get   '/422' => 'errors#unprocessable'
  get   '/500' => 'errors#server_error'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

end
