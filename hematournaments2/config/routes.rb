Rails.application.routes.draw do
  resources :fighters
  root "fighter#index"
end
