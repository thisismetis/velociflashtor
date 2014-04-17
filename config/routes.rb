Velociflashtor::Application.routes.draw do

  constraints Clearance::Constraints::SignedIn.new do
    root to: 'dashboards#show', as: :signed_in_root
  end

  root 'homes#show'

  resource :dashboards, only: [:show]

  resources :decks, except: [:index] do
    resources :cards, only: [:new, :create, :index]
    resource :test, only: [:show]
  end

  resource :search, only: [:show]
  resource :guess, only: [:show, :create]
end
