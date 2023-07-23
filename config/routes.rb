# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins
  namespace :admins do
    resources :items do
      member do
        patch 'soldout'
        patch 'fix'
        delete 'delete_image'
      end
    end
  end
  post '/add_item', to: 'carts#add_item'
  root 'items#index'
  resources :items, param: :id
  resources :categories
  resources :carts do
    member do
      get 'confirm_order'
      post 'place_order'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
