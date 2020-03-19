Rails.application.routes.draw do
  concern :reviewable do
    resources :reviews, except: %i[show index]
  end
  resources :professors do
    collection { get 'search' }
    resources :courses, concerns: :reviewable
    # resources :reviews, except: %i[show index]
  end
  # resources :reviews
  resources :courses do
    collection { get 'search' }
    resources :professors, concerns: :reviewable
    # resources :reviews, except: [:show, :index]
  end
  get 'login' => 'login#index'
  get 'search' => 'search#index'
  # get 'reviews' => 'reviews#index'
  # get 'professors' => 'professors#index'

  get 'reviews/new' => 'reviews#select'

  resources :reviews

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
