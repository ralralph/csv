Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :facilities do
    collection { post :import }
  end

  resources :users do
    collection { post :import }
  end
end
