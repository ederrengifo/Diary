Rails.application.routes.draw do

  resources :timelines
  resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/signout" => "sessions#new", as: "sign_in"

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  resources :timelines do
    resources :comments do
      put :toggle, on: :member
    end
  end

  root to: "timelines#index"

end
