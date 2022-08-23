Rails.application.routes.draw do
  root "index#index"
  resources :questions
end
