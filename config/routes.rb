# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  unauthenticated do
    root "users#index"
  end

  devise_scope :user do
    root 'groups#index', as: 'categories'
    resources :users 
    resources :groups, only: %i[index create new destroy] do
      resources :purchases, only: %i[index create new destroy]
    end
  end
  

  # Defines the root path route ("/")
  # root "articles#index"
end
