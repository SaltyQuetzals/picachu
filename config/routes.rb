Rails.application.routes.draw do
  resources :professors do
    collection { get 'search' }
  end
  resources :reviews
  resources :courses do
    collection { get 'search' }
  end


  get 'reviews/index'

  get 'professor/index'

  get 'login' => 'login#index'
  get 'search' => 'search#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
