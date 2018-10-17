Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    invitations: 'users/invitations'
  }
  resources :users, only: :destroy
  resource :family, only: :show
  # selectionsは、UIの都合上(※1)設けたものであり、BodiesControllerとは分離しておきたかったため、
  # collectionメソッドは使わず実装している。
  # ※1:ヘッダー上のリンクからのメモ追加のため
  namespace :bodies do
    resources :selections, only: :index
  end
  resources :bodies, except: :show do
    resources :notes
  end

  ActiveAdmin.routes(self)
end
