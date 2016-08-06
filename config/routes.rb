Rails.application.routes.draw do
  default_url_options host: 'localhost', port: 3000

  resources :cars do
    member do
      get 'claim' => 'cars#claim'
      get 'unclaim' => 'cars#unclaim'
    end
  end

  get 'verification/:token', to: 'users#verify', as: 'verify_email'

  get 'auth/:provider/callback', to: 'sessions#oauth'
  get 'my_cars' => 'cars#my_cars'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'cars#index'

  resources :users,
    only: [:new, :create],
    path_names: { new: 'signup' }

  get 'login' => 'sessions#login'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
