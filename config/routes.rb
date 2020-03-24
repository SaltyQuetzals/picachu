
Rails.application.routes.draw do
  root 'login#index'

  resources :professors do
    collection { get 'search' }
  end
  resources :courses do
    collection { get 'search' }
  end
  get 'login' => 'login#index'
  # get 'login', to: redirect('/auth/google_oauth2'), as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'me', to: 'me#show', as: 'me'
  get 'search' => 'search#index'
<<<<<<< HEAD
  get 'search/professors' => 'search#professors', as: :search_professors
end
=======

  resources :reviews, except: %i[index]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
>>>>>>> origin/master
