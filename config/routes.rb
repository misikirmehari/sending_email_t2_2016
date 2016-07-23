Rails.application.routes.draw do
  resources :cars
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'cars#index'

  resources :users,
    only: [:new, :create],
    path_names: { new: 'signup' }
end
