Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get 'profile', to: 'users#show'
  resource :family, only: %i[show destroy]

end
