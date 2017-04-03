Rails.application.routes.draw do
  resources :pools
  root "fighter#index"
  resources :tournament_fighters
  resources :tournaments
  resources :fighters

  scope 'tournaments', controller: 'tournaments' do
    post ':id/add_fighter' => :add_fighter, as: :tournaments_add_fighter
    delete ':id/remove_fighter' => :remove_fighter, as: :tournaments_remove_fighter
  end
end
