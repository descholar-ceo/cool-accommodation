# frozen_string_literal: true

Rails.application.routes.draw do
  resources :favourites, only: [:index]
  resources :accommodations
  resources :users do
    resources :favourites
  end
  root to: "favourites#index"
end
