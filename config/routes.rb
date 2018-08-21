Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resource :family, only: %i[show destroy]
  resources :bodies, except: :index
  resources :notes
end
