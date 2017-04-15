# == Schema Information
#
# Table name: fighters
#
#  id         :integer          not null, primary key
#  first_name :string           not null
#  last_name  :string
#  club       :string
#  gender     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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
    first_name + " " + last_name + ", " + (club || "No club set")
  end
end
