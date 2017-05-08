# == Schema Information
#
# Table name: matches
#
#  id              :integer          not null, primary key
#  pool_id         :integer          not null
#  order           :integer          not null
#  red_fighter_id  :integer          not null
#  blue_fighter_id :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Match < ApplicationRecord
  validates :pool_id, :red_fighter_id, :blue_fighter_id, :order, presence: true
  belongs_to :pool
  belongs_to :red_fighter,
    class_name: 'Fighter',
    primary_key: :id,
    foreign_key: :red_fighter_id
  belongs_to :blue_fighter,
    class_name: 'Fighter',
    primary_key: :id,
    foreign_key: :blue_fighter_id
  has_many :exchanges

  def red_fighter_name
    Fighter.find(red_fighter_id).name
  end

  def blue_fighter_name
    Fighter.find(blue_fighter_id).name
  end

  def remove_exchange(exchange_id)
    exchanges.destroy(exchange_id)
  end

  def add_exchange(fighter_color, target_rule, penalty_fighter_color, penalty_rule)
    exchange = exchanges.create
    exchange.order_in_match = exchanges.count
    penalty_fighter_id = penalty_fighter_color == Exchange::RED ? red_fighter_id : blue_fighter_id
    if !fighter_color.nil?
      exchange.scoring_fighter_id = fighter_color == Exchange::RED ? red_fighter_id : blue_fighter_id
    else
      exchange.scoring_fighter_id = penalty_fighter_color == Exchange::RED ? blue_fighter_id : red_fighter_id
    end
    exchange.save
    if !target_rule.nil?
      exchange.exchange_rules.create(rule_id: target_rule, fighter_id: exchange.scoring_fighter_id)
    end
    if !penalty_rule.nil?
      exchange.exchange_rules.create(rule_id: penalty_rule, fighter_id: penalty_fighter_id)
    end
    exchange.save
  end
end
