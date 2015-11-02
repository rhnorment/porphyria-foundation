Rails.application.routes.draw do

  get 'pages/*id' => 'pages#show', as: :page, format: false

  root to: 'pages#show', id: 'home'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

end
