
Rails.application.routes.draw do
  get 'login' => 'login#index'
  # get 'login', to: redirect('/auth/google_oauth2'), as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'me', to: 'me#show', as: 'me'
  get 'search' => 'search#index'
  get 'search/professors' => 'search#professors', as: :search_professors
end