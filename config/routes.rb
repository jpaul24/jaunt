Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :activities do
    resources :reviews, only: [:create, :edit, :update, :destroy]
  end
  resources :trips
  resources :users
  resources :shortlisted_activities
end
