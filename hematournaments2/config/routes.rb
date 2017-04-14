Rails.application.routes.draw do
  root "tournaments#index"
  resources :tournament_fighters
  resources :tournaments
  resources :fighters

  scope 'tournament' do
    scope controller: 'tournaments' do
      post ':id/add_fighter' => :add_fighter, as: :tournaments_add_fighter
      delete ':id/remove_fighter' => :remove_fighter, as: :tournaments_remove_fighter
    end

    scope ':tournament_id' do
      resources :pools
      resources :pool_fighters
    end
  end
end
