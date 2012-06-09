Persistence::Application.routes.draw do
  resources :rooms, only: [:show, :index]
  resources :messages, only: [:index]
end
