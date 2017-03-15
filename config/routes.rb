Rails.application.routes.draw do
  get 'payments/new'

  get 'payments/create'

  get 'carts/new'

  get 'carts/create'

  get 'carts/edit'

  get 'carts/update'

  get 'carts/show'

  get 'carts/destroy'

  get 'line_items/create'

  get 'line_items/destroy'

  get 'line_items/update'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
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
