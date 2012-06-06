Persistence::Application.routes.draw do
  resources :rooms, only: [:create, :update, :destroy]
  resources :messages, only: [:create, :update, :destroy]
end
