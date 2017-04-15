# == Schema Information
#
# Table name: pools
#
#  id            :integer          not null, primary key
#  tournament_id :integer          not null
#  name          :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Pool < ApplicationRecord
  validates :tournament_id, :name, presence: true
  belongs_to :tournament
  has_many :pool_fighters,
    class_name: 'PoolFighter',
    primary_key: :id,
    foreign_key: :pool_id,
    dependent: :destroy
  has_many :fighters,
    through: :pool_fighters,
    source: :fighter
  has_many :matches,
    class_name: 'Match',
    primary_key: :id,
    foreign_key: :pool_id

  TWO_PEOPLE = [
    [0, 1]
  ]
  THREE_PEOPLE = [
    [0, 1],
    [1, 2],
    [0, 2]
  ]
  FOUR_PEOPLE = [
    [0, 1],
    [2, 3],
    [2, 1],
    [3, 1],
    [3, 0],
    [2, 0]
  ]
  FIVE_PEOPLE = [
    [0, 4],
    [1, 2],
    [0, 3],
    [1, 4],
    [2, 3],
    [0, 1],
    [3, 4],
    [0, 2],
    [1, 3],
    [2, 4]
  ]
  SIX_PEOPLE = [
    [0, 1],
    [2, 3],
    [4, 5],
    [0, 2],
    [1, 4],
    [2, 4],
    [0, 3],
    [1, 5],
    [2, 4],
    [3, 5],
    [0, 4],
    [1, 2],
    [3, 4],
    [0, 5],
    [1, 3]
  ]

  MATCH_ASSIGNMENTS = {
    2 => TWO_PEOPLE,
    3 => THREE_PEOPLE,
    4 => FOUR_PEOPLE,
    5 => FIVE_PEOPLE,
    6 => SIX_PEOPLE
  }

  def tournament_name
    Tournament.find(tournament_id).name
  end

  def remove_fighter(fighter_id)
    fighters_to_delete = pool_fighters.where('fighter_id = ?', fighter_id)
    fighters_to_delete.each do |fighter|
      fighter.destroy
    end
  end

  def add_fighter(fighter_id)
    fighter = Fighter.find_by_id(fighter_id)
    fighters << fighter
  end

  def destroy_matches
    matches.each do |match|
      match.destroy
    end
  end

  def create_matches
    destroy_matches

    assignements = MATCH_ASSIGNMENTS[fighters.count]
    return if assignements.nil?

    assignements.each_with_index do |pair, index|
      matches.create(
        order: index + 1,
        red_fighter_id: fighters[pair[0]].id,
        blue_fighter_id: fighters[pair[1]].id
        )
    end
  end
end
