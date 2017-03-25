class TournamentFighter < ApplicationRecord
    belongs_to :tournament
    belongs_to :fighter
end
