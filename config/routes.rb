Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :articles do
    resources :comments
    get :inactive, on: :collection
    get :activate, on: :member
  end
  root "articles#index"
end
