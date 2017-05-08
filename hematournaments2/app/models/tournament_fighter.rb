# == Schema Information
#
# Table name: tournament_fighters
#
#  id            :integer          not null, primary key
#  tournament_id :integer          not null
#  fighter_id    :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class TournamentFighter < ApplicationRecord
  validates :fighter_id, :tournament_id, presence: true
  validates_uniqueness_of :fighter_id, scope: :tournament_id

  belongs_to :tournament
  belongs_to :fighter
  def tournament_name
    Tournament.find(tournament_id).name
  end
  def fighter_name
    Fighter.find(fighter_id).name
  end
end
