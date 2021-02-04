# frozen_string_literal: true

Rails.application.routes.draw do
  resources :favourites, only: [:index]
  resources :accommodations
  resources :login, only: [:create, :destroy]
  resources :users do
    resources :favourites
    get :profile_pic, on: :member
  end
  root to: "favourites#index"
end
