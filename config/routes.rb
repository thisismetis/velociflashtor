Velociflashtor::Application.routes.draw do

  constraints Clearance::Constraints::SignedIn.new do
    root to: 'dashboards#show', as: :signed_in_root
  end

  root 'homes#show'

  resource :dashboards, only: [:show]
  resource :tags, only: [:show]
  resources :cards, only: [:edit, :update, :destroy] do
    resources :guess_checkers, only: [:create]
  end
  resource :results, only: [:show]

  resources :decks do
    resources :cards
    resource :test, only: [:show]
    resources :image_searches, only: [:create]
    resources :likes, only: [:create]
  end

  resources :likes, only: [:destroy]

  resource :search, only: [:show]
  resource :guess, only: [:show, :create, :new]

end
