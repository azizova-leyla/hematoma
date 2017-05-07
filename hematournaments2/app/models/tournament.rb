# == Schema Information
#
# Table name: tournaments
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  date        :datetime         not null
#  weapon      :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  rule_set_id :integer
#

class Tournament < ApplicationRecord
  has_many :tournament_fighters,
    class_name: 'TournamentFighter',
    primary_key: :id,
    foreign_key: :tournament_id,
    dependent: :destroy
  has_many :fighters,
    through: :tournament_fighters,
    source: :fighter
  has_many :pools, dependent: :destroy
  has_many :matches,
    through: :pools

  def remove_fighter(fighter_id)
    fighters_to_delete = tournament_fighters.where('fighter_id = ?', fighter_id)
    fighters_to_delete.each do |fighter|
      fighter.destroy
    end
  end

  def add_or_create_fighter(first_name, last_name, club = nil)
    fighter = Fighter.where(first_name: first_name, last_name: last_name)

    if fighter.empty?
      fighters.create(first_name: first_name, last_name: last_name, club: club)
      "#{first_name} #{last_name} created and added"
    else
      add_existing_fighter(fighter.first)
    end
  end

  def add_existing_fighter(fighter)
    if fighters.include?(fighter)
      "#{fighter.first_name} #{fighter.last_name} is already in the tournament"
    else
      fighters << fighter
      "#{fighter.first_name} #{fighter.last_name} added"
    end
  end

  def not_assigned_fighters
    assigned_fighters = []
    pools.each do |pool|
      assigned_fighters = assigned_fighters + pool.fighters
    end
    fighters - assigned_fighters
  end

  def reassign_fighters_to_pool(fighter_ids, new_pool_id)
    new_pool = pools.find(new_pool_id)
    fighter_ids.each do |fighter_id|
      pool_fighters = PoolFighter.where(fighter_id: fighter_id)
      if !pool_fighters.empty?
        pool_fighters.each do |pool_fighter|
          if pool_fighter.pool_id != new_pool_id
            pool_fighter.destroy
          end
        end
      end
      new_pool.add_fighter(fighter_id)
    end
  end
end
