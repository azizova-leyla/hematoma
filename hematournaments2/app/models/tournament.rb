class Tournament < ApplicationRecord
    has_many :tournament_fighters,
      class_name: 'TournamentFighter',
      primary_key: :id,
      foreign_key: :tournament_id,
      dependent: :destroy
    has_many :fighters,
      through: :tournament_fighters,
      source: :fighter
end
