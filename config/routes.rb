Velociflashtor::Application.routes.draw do

  constraints Clearance::Constraints::SignedIn.new do
    root to: 'dashboards#show', as: :signed_in_root
  end

  root 'homes#show'

  resource :dashboards, only: [:show]
  resource :results, only: [:show]
  resource :search, only: [:show]
  resource :guess, only: [:show, :create, :new]

  resources :tags, only: [:show]
  resources :likes, only: [:destroy]
  resources :cards, only: [:edit, :update, :destroy] do
    resources :guess_checkers, only: [:create]
  end

  resources :decks do
    resources :cards
    resource :test, only: [:show]
    resources :image_searches, only: [:create]
    resources :likes, only: [:create]
  end
end
