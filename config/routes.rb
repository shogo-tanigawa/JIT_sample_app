Rails.application.routes.draw do
  get 'users/dash_boards'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root 'users#dash_boards'
  
  devise_for :users
  resources :users, only: [:dash_boards]
  get 'users/dash_boards', to: 'users#dash_boards', as: 'user_dashboard'

  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
  end
end
