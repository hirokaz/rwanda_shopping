Rails.application.routes.draw do
  devise_for :admins
  namespace :admins do
    resources :items, only: [:edit, :update, :index, :new, :create, :destroy]
  end
  post "/add_item", to: "carts#add_item"
  root "items#index"
  resources :items, param: :id
  resources :categories
  resources :carts, only: [:show, :index, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
