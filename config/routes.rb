Rails.application.routes.draw do
  get 'sessions/create'
  get 'sessions/new'
  root to: "questions#index"

  resources :questions do
    member do
      put :hide
      patch :hide
    end
  end

  resources :users, only: %i[new create]

  resource :session, only: %i[new create destroy]
end