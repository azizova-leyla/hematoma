class TournamentFighter < ApplicationRecord
    belongs_to :tournament
    belongs_to :fighter
  def tournament_name
    Tournament.find(tournament_id).name
  end
  def fighter_name
    Fighter.find(fighter_id).name
  end
end
