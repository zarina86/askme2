Rails.application.routes.draw do
  root "questions#index"

  resources :questions do 
    member do
      put :hide
      patch :hide
    end
  end
end
