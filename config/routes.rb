# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :accommodations do
    get :accommodation_pic, on: :member
  end
  resources :login, only: [:create]
  resources :favourites
  post '/users/:user_id/favourites/:favourite_id', to: 'favourites#destroy', as: 'remove_favourite'
  resources :users do
    resources :favourites
  end
end
