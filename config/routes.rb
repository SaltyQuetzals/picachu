Rails.application.routes.draw do
  resources :reviews
  get 'login' => 'login#index'
  get 'search' => 'search#index'
  get 'home' => 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
