Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resource :family, only: %i[show destroy]
  resources :bodies, except: :index

  namespace :notes do
    resources :latests, only: :index
  end
  resources :notes, except: :index
end
