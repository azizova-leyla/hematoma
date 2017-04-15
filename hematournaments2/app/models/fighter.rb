class Fighter < ApplicationRecord
    has_many :tournament_fighter,
        class_name: 'TournamentFighter',
        primary_key: :id,
        foreign_key: :fighter_id
    has_many :pool_fighter,
        class_name: 'PoolFighter',
        primary_key: :id,
        foreign_key: :fighter_id

  def name
    first_name + " " + last_name
  end
end