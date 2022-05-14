# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users do
    resources :groups, only: %i[index create new destroy] do
      resources :purchases, only: %i[index create new destroy]
    end
  end
  root 'users#index'

  # Defines the root path route ("/")
  # root "articles#index"
end
