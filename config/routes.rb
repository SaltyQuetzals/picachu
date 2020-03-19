Rails.application.routes.draw do
  resources :professors do
    collection { get 'search' }
  end
  resources :courses do
    collection { get 'search' }
  end
  get 'login' => 'login#index'
  get 'search' => 'search#index'

  resources :reviews, except: %i[index]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
