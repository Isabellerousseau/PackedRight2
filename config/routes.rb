Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :orders do
        resources :messages, only: [ :index, :create, :destroy ]
      end
    end
  end

  resources :parcels
  resources :orders do
    resources :messages, only: [:create, :destroy]
    # resources :deliveries, only: [ :create]
    # resources :reviews, only: [:new, :create, :show]
  end
  resources :drivers
  # resources :deliveries, only: [:index, :show]
  resources :reviews
end
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
