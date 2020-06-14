Rails.application.routes.draw do
  devise_for :users
  # URL -> /
  root 'posts#index'
  get 'posts' => "posts#index"
  get 'posts/new' =>'posts#new'
  post  'posts' => 'posts#create'   
  delete  'posts/:id'  => 'posts#destroy'
  patch   'posts/:id'  => 'posts#update'
  get   'posts/:id/edit'  => 'posts#edit'
  get   'users/:id'   =>  'users#show'


  # For details on the DSL availrakable within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :show, :create, :edit, :destroy] do
    resources :comments, only: [:new, :create]
  end

root 'posts#index'
end