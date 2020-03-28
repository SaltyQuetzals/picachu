Rails.application.routes.draw do
  root 'login#index'

  resources :professors do
    collection { get 'search' }
    get '/courses/:course_id', to: 'professors#show_course', as: 'course'
  end
  resources :courses do
    collection { get 'search' }
  end
  get 'login' => 'login#index'
  delete '/logout', to: 'sessions#destroy'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'search' => 'search#index'

  resources :reviews, except: %i[index] do
    post '/report' => 'reviews#report'
  end
  resources :sessions, only: %i[create delete]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
