Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'facilities#index'

  # resources :users do
  #   collection { post :import }
  # end
end
