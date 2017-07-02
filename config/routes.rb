Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "tasks#index"
  resources :tasks
  post "/tasks/:id", to: "tasks#boolean"
end