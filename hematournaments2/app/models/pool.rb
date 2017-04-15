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
    pool_fighters.create(fighter_id: fighter_id)
  end

  def add_existing_fighter(fighter)
    if fighters.include?(fighter)
      "#{fighter.first_name} #{fighter.last_name} is already in the tournament"
    else
      tournament_fighters.create(fighter_id: fighter.id)
      "#{fighter.first_name} #{fighter.last_name} added"
    end
  end

end
