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
      scope 'pool', controller: 'pools' do
        post ':id/add_fighter' => :add_fighter, as: :pool_add_fighter
        delete ':id/remove_fighter' => :remove_fighter, as: :pool_remove_fighter
        post 'add_fighters' => :add_fighters, as: :pools_add_fighters
        post ':id/create_matches' => :create_matches, as: :pool_create_matches
      end
      resources :pool_fighters
      scope ':pool_id' do
        resources :matches
        scope ':match_id', controller: 'matches' do
          delete ':id/remove_exchange' => :remove_exchange, as: :remove_exchange
          post ':id/add_exchange' => :add_exchange, as: :add_exchange
        end
      end
    end
  end

  scope 'rule_set', controller: 'rule_set' do
    get ':id' => :show, as: :rule_set
    post ':id/add_target' => :add_target_rule, as: :add_target_rule
    post ':id/add_penalty' => :add_penalty_rule, as: :add_penalty_rule
    delete ':id/remove_rule' => :remove_rule, as: :remove_rule
  end
end
