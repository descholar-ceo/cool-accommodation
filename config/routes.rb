# frozen_string_literal: true

Rails.application.routes.draw do
  resources :favourites, only: [:index]
  resources :accommodations
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[show] do
    resources :favourites
  end
end
