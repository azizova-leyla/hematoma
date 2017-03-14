Rails.application.routes.draw do
  resources :tournaments
  resources :fighters
  root "fighter#index"
end
