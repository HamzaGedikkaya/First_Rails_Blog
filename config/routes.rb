Rails.application.routes.draw do
  # get 'articles/index'
  # get 'articles/show'
  # get 'articles/update'
  # get 'articles/create'
  # get 'articles/destroy'
  resources :articles do
    resources :comments
  end
  # root "articles#index"
end
