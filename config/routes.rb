Rails.application.routes.draw do
  devise_for :admins
  devise_for :publics

  namespace :admin do
    get 'homes/index'
  end

  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
