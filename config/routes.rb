Rails.application.routes.draw do

  root to: 'pages#home'
  get 'styleguide', to: 'pages#styleguide'
  get "/reservations/find"

  devise_for :users

  as :user do
    get 'account/profile/edit', to: 'devise/registrations#edit'
    patch 'account/profile', :as => :user_root
  end

  resources :reservations, only: [:show] do
    member do
      get :confirmed
    end

    resources :orders, only: [:new, :create]
    resources :payments, only: [:new, :create]
  end

  namespace :account do
    resource :profile, only: [:show]
    resources :orders, only: [:index, :show]
    resources :reservations, only: [:index, :show]
  end
end
