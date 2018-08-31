Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    invitations: 'users/invitations'
  }
  resources :users, only: :destroy

  resource :family, only: :show

  resources :bodies, except: :index

  namespace :notes do
    resources :latests, only: :index
  end
  resources :notes, except: :index
end
