# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :accommodations do
    get :accommodation_pic, on: :member
  end
  resources :login, only: %i[:create :destroy]
  resources :users do
    resources :favourites, except: %i[edit update]
    get :profile_pic, on: :member
  end
  root to: "favourites#index"
end
