Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources: :activities
  resources: :trips do
    resources: :reviews, only: :create
  end
  resources: :reviews, only: [:edit, :update, :destroy]
  resources: :users do

  end
  resources: :shortlisted_activities
  resources: :activity_categories
end
