Rails.application.routes.draw do
  resources :tournament_fighters
  resources :tournaments
  resources :fighters
  root "fighter#index"
end
