Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  get 'messages' => 'messages#index'
  resources :users,only: [:edit,:update]
  resources :groups,only: [:index,:new,:create,:edit,:update]
end
