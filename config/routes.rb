# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :hawkers do
    resources :comments
  end
  root 'hawkers#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
