Rails.application.routes.draw do
  resources :professors do
    collection { get 'search' }
    resources :reviews, except: %i[show index]
  end
  # resources :reviews
  resources :courses do
    collection { get 'search' }
    # resources :reviews, except: [:show, :index]
  end
  get 'login' => 'login#index'
  get 'search' => 'search#index'
  # get 'reviews' => 'reviews#index'
  # get 'professors' => 'professors#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
