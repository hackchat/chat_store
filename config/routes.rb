Persistence::Application.routes.draw do
  mount Resque::Server, :at => "/resque"
  resources :rooms, only: [:create, :update, :destroy]
  resources :messages, only: [:create, :update, :destroy]
end
