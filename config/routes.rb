# frozen_string_literal: true

Rails.application.routes.draw do
  get 'comments/new'
  get 'comments/edit'
  get 'hawkers/index'
  get 'hawkers/show'
  get 'hawkers/new'
  get 'hawkers/edit'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
