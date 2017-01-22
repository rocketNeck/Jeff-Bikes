Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'

  get '/privacy_policy' => 'pages#privacy_policy'
end
