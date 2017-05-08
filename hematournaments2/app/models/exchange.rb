# == Schema Information
#
# Table name: exchanges
#
#  id                 :integer          not null, primary key
#  match_id           :integer          not null
#  scoring_fighter_id :integer          not null
#  order_in_match     :integer          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Exchange < ApplicationRecord
  belongs_to :match
  has_many :exchange_rules,
    class_name: 'ExchangeRule',
    primary_key: :id,
    foreign_key: :exchange_id
  has_many :rules,
    through: :exchange_rules,
    source: :rule
  belongs_to :scoring_fighter,
    class_name: 'Fighter',
    primary_key: :id,
    foreign_key: :scoring_fighter_id

  RED = 'Red'
  BLUE = 'Blue'

  def scoring_color
    scoring_fighter_id == match.red_fighter_id ? RED : BLUE
  end

  def not_scoring_color
    scoring_color == RED ? BLUE : RED
  end

  def target
    rules.each do |rule|
      if !rule.is_penalty
        return "#{rule.target}(+#{rule.points})"
      end
    end
    return "n/a"
  end

  def penalty_fighter_color
    rules.each do |rule|
      if rule.is_penalty
        return not_scoring_color
      end
    end
    return "n/a"
  end

  def penalty_type
    rules.each do |rule|
      if rule.is_penalty
        return "#{rule.target}(#{rule.points})"
      end
    end
    return "n/a"
  end

  def total_points
    points = 0
    rules.each do |rule|
      points = points + rule.points
    end
    points
  end
end
