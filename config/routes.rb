Rails.application.routes.draw do


  root 'pages#home'

  resources :bikes do
    resources :comments, only: [:create, :destroy, :show, :index]
  end

  devise_for :users,
             path: '',
             path_names: {sign_in:'login', sign_out: 'logout', edit: 'profile'},
             controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}

  resources :users, only: [:show]

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end


  get '/privacy_policy' => 'pages#privacy_policy'
  get '/about' => 'pages#about'

  get 'tags/:tag', to: 'bikes#index', as: "tag"
end
