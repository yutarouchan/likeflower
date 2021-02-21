Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 root 'varieties#index'
 get 'varieties/about' => 'varieties#about'
 get 'varieties/rank' => 'varieties#rank'
 resources :varieties do
  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create]
  end
end
