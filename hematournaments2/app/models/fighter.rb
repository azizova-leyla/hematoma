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
  has_many :exchanges,
    class_name: 'Exchange',
    primary_key: :id,
    foreign_key: :scoring_fighter_id
  has_many :exchange_rules,
    class_name: 'ExchangeRule',
    primary_key: :id,
    foreign_key: :fighter_id

  def name
    last_name_if_present = last_name || ""
    club_name = club || "No club"
    "#{id}: #{first_name} #{last_name_if_present}, #{club_name}"
  end
end
