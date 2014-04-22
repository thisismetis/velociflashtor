Velociflashtor::Application.routes.draw do

  constraints Clearance::Constraints::SignedIn.new do
    root to: 'dashboards#show', as: :signed_in_root
  end

  root 'homes#show'

  resource :dashboards, only: [:show]
  resource :tags, only: [:show]
  resources :cards, only: [:edit, :update]
  resources :results, only: [:show, :index]
  
  resources :decks do
    resources :cards, only: [:new, :create, :index]
    resource :test, only: [:show]
  end

  resource :search, only: [:show]
  resource :guess, only: [:show, :create]

end
