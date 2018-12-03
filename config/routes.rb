Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get 'welcome/index'

  root 'welcome#index'

  post '/' => 'sessions#create'

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

   resources :users
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy'

    get '/signup' => 'users#new'
    post '/users' => 'users#create'

    get "posts/search" => "posts#search", as: 'search'
    get "posts/random" => "posts#random", as: "random"

    resources :posts do
      resources :comments, only: [:index, :create, :destroy], shallow:true
    end

end
