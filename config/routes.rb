Rails.application.routes.draw do
  devise_for :users
  devise_for :models
  resources :products do
    resources :orders
  end

  root "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
