Rails.application.routes.draw do
  resources :timelines
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "timelines#index"
end
