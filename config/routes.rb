# frozen_string_literal: true

Rails.application.routes.draw do
  resources :favourites
  resources :accommodations
  resources :users
end
