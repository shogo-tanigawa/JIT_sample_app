Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root 'users#dash_boards'
  
  devise_for :users
  resources :users, only: [:dash_boards] do
    collection do
      get 'dash_boards', to: 'users#dash_boards', as: 'dashboard'
      resources :articles, path: 'articles'
    end
  end

  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
  end
end
