# frozen_string_literal: true

Rails.application.routes.draw do
  concern :api_base do
    devise_for :users,
      controllers: {
          sessions: 'users/sessions',
          registrations: 'users/registrations'
      }

    resources :books, only: [] do
      collection do
        get :reading_lists
        get :finished_books
        get :discover
      end
    end
  end

  namespace :v1 do
    concerns :api_base
  end
end
