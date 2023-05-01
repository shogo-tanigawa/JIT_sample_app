Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root 'application#hello'
  
  devise_for :users

  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
  end
end
