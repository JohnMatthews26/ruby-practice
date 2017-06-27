Rails.application.routes.draw do
  resources :users, only: [:create, :new, :show]
  resource :session, only: [:create, :new, :destroy]
  resources :bands
  resources :bands, only: [:show] do
    resources :albums, only: [:new]
  end
  resources :albums, except: [:index, :new]
end
