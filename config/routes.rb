Rails.application.routes.draw do
  concern :api_base do
    devise_for :users

    resources :books, only: [] do
      collection do
        get(:reading_lists)
        get(:finished_books)
        get(:discover)
      end
    end
  end

  namespace :v1 do
    concerns :api_base
  end
end
