Rails.application.routes.draw do
  resources :facilities do
    collection { post :import }
  end

  resources :users do
    collection { post :import }
  end
end
