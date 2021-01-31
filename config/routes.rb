# frozen_string_literal: true

Rails.application.routes.draw do
  resources :favourites, only: [:index]
  resources :accommodations do
    resources :favourites
  end
  resources :users
  root to: "favourites#index"
end
