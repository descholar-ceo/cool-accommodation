# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :favourites, only: [:index]
  resources :accommodations do
    get :accommodation_pic, on: :member
  end
  resources :login, only: [:create, :destroy]
  resources :users do
    resources :favourites
    get :profile_pic, on: :member
  end
  root to: "favourites#index"
end
