Rails.application.routes.draw do
  root 'homes#top'
  devise_for :customers
  get 'homes/top'
  get 'homes/about'
  get 'search' => 'homes#search'
  resources :customers, only: [:index, :show, :edit, :update]
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  resources :customers do
    get :followed, on: :member
    get :followers, on: :member
  end
  resources :relationships, only: [:index, :show]
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  get 'withdrawal' => 'customers#withdrawal'
  patch 'withdrawal_update' => 'customers#withdrawal_update'
  resources :posts, only: [:new, :show, :edit, :create, :update, :destroy]



  devise_for :admins
  namespace :admin do
    get 'homes/index'
    resource :customers, only: [:show, :index, :update]

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
