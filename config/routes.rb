Rails.application.routes.draw do

  devise_for :users
  as :user do
    get 'account/profile/edit', to: 'devise/registrations#edit'
    patch 'account/profile', :as => :user_root
  end

  root to: 'pages#home'
  get 'styleguide', to: 'pages#styleguide'

  resources :reservations, only: [:show] do
    resources :orders, only: [:new, :create]
  end

  namespace :account do
    resource :profile, only: [:show]
    resources :orders, only: [:index, :show]
    resources :reservations, only: [:index, :show]
  end

end
