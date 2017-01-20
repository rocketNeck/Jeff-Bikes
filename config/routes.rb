Rails.application.routes.draw do
  root 'pages#home'

  get '/privacy_policy' => 'pages#privacy_policy'
end
