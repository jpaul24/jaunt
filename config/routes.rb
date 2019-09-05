Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root to: 'pages#home'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :activities do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
    member do
      post 'up-vote'
      post 'down-vote'
    end
  end
  resources :trips do
    member do
      post 'like'
    end
    resources :shortlisted_activities, only: [:show, :new, :create]
    member do
      get 'trip_map'
    end
  end
  resources :users do
    member do
      get 'reviews'
      get 'activities'
    end
  end
  resources :shortlisted_activities, only: [:create, :destroy]
end

