Rails.application.routes.draw do
  root 'application#hello'
  
  devise_for :users

  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
  end
end
