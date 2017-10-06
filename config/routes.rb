Rails.application.routes.draw do
  root 'questions#index'

  devise_for :users

  resources :questions do
    resources :comments, only:[:create]
  end

  resources :answers do
    resources :comments, only:[:create]
  end

end
