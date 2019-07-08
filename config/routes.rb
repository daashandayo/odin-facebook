# frozen_string_literal: true

Rails.application.routes.draw do
  get '/users', to: "users#index"
  get 'users/show/:id', to: "users#show", as: "users_show"
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: "home#index"
  post '/friendships', to: "friendships#create", as: "friendships_create"
end
