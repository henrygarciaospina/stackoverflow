Rails.application.routes.draw do
  devise_for :users

  resources :questions do
    resources :comments, only:[:create], module: :questions
    resources :votes, only:[:create, :destroy], module: :questions
  end

  resources :answers do
    resources :comments, only:[:create], module: :answers
  end
  root 'questions#index'
  
end
