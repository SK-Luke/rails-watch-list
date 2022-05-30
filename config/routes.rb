Rails.application.routes.draw do
  root to: 'lists#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists, only: %i[index show new create destroy] do
    # resources :bookmarks, only: %i[index show new create]
  end
  # able to list all movie, and add movie to list
  resources :movies, only: %i[index new create destroy] do
    resources :bookmarks, only: %i[new create destroy]
  end
end
