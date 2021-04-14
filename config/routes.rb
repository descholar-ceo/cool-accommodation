# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :accommodations do
    get :accommodation_pic, on: :member
  end
  resources :login, only: [:create]
  resources :favourites
  resources :users do
    resources :favourites
  end
end
