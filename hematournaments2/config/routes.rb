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
      scope controller: 'pools' do
        post ':id/add_fighter' => :add_fighter, as: :pool_add_fighter
        delete ':id/remove_fighter' => :remove_fighter, as: :pool_remove_fighter
      end
      resources :pool_fighters
    end
  end
end
