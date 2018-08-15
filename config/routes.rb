Rails.application.routes.draw do
  devise_scope :user do
    root to: 'users/registrations#new'
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get 'profile', to: 'users#show'
  resource :family, only: %i[show destroy]

end
