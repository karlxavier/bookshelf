# frozen_string_literal: true

Rails.application.routes.draw do
  concern :api_base do
    post :user_token, to: 'user_token#create'
    get :auth_token, to: 'user_token#auth_token'

    resources :books, only: %i(show index) do
      collection do
        get :reading_lists
        get :finished_books
        get :discover
        get :search
        post :add_reading_list
      end

      member do
        post :mark_as_read
        post :mark_as_unread
        post :remove_from_list
      end
    end

    resources :users, only: %i(create edit update)
  end

  namespace :v1 do
    concerns :api_base
  end
end
