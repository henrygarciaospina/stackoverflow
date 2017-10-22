Rails.application.routes.draw do
  devise_for :users
  resources :comments

  resources :questions do
   resources :answers, except: [:show] do
     resources :comments, except: [:show], module: :answers
     resources :votes, only:[:create,:update, :destroy], module: :answers
   end

   resources :votes, only:[:create,:update, :destroy], module: :questions
   resources :comments, except: [:show], module: :questions
 end

  root 'questions#index'
end
