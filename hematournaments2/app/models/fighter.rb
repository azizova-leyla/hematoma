class Fighter < ApplicationRecord
    has_many :tournament_fighters,
        class_name: 'TournamentFighter',
        primary_key: :id,
        foreigh_key: :fighter_id
end
