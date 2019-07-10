# frozen_string_literal: true

Rails.application.routes.draw do
  get '/users', to: "users#index"
  get 'users/show/:id', to: "users#show", as: "users_show"
  devise_for :users, controllers: { sessions: 'users/sessions' }, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: "home#index"
  post '/friendships', to: "friendships#create", as: "friendships_create"
  get '/notifications', to: "friendships#index", as: "notifications"
  put '/friendships', to: "friendships#update", as: "friendships_update"

  post '/posts', to:     "posts#create", as: "post_create"
  post '/likes', to:     "likes#create", as: "like_create"
  post '/comments', to: "comments#create", as: "comment_create"

  get  '/timeline', to:  "posts#index"
end
