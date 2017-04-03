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

  def remove_fighter(fighter_id)
    fighters_to_delete = tournament_fighters.where('fighter_id = ?', fighter_id)
    fighters_to_delete.each do |fighter|
      fighter.destroy
    end
  end

  def add_or_create_fighter(first_name, last_name)
    fighter = Fighter.where(first_name: first_name, last_name: last_name)

    if fighter.empty?
      fighters.create(first_name: first_name, last_name: last_name)
      "#{first_name} #{last_name} created and added"
    else
      add_existing_fighter(fighter.first)
    end
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
