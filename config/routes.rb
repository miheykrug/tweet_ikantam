Rails.application.routes.draw do
  get 'pages/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#index"
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/sign_in', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
end
