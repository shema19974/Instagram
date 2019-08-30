Rails.application.routes.draw do
  root 'sessions#new'
  resources :profiles
  resources :posts
  get 'sessions/new'
  resources :users
  resources :favorites, only: [:create, :destroy, :index]
  resources :sessions, only: [:new, :create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
