Rails.application.routes.draw do
  get 'shopping_carts/create'

  get 'shopping_carts/show'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resource :shopping_cart
  resources :products do
    resources :orders
    collection do
      get 'search'
      post 'search'
    end
  end

  root "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
