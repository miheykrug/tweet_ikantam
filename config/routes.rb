Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#index"
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get '/sign_in', to: 'sessions#index'
  delete '/logout', to: 'sessions#destroy'
  resources :tweets, only: [:index, :create]

end
