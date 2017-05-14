# == Schema Information
#
# Table name: rule_sets
#
#  id            :integer          not null, primary key
#  description   :string
#  weapon        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  tournament_id :integer
#

class RuleSet < ApplicationRecord
  has_many :rule_set_rules,
    class_name: 'RuleSetRule',
    primary_key: :id,
    foreign_key: :rule_set_id,
    dependent: :destroy
  has_many :rules,
    through: :rule_set_rules,
    source: :rule
  belongs_to :tournament

  TARGET_RULE = 'Target'
  PENALTY_RULE = 'Penalty'
  MODIFIER_RULE = 'Modifier'

  def remove_rule(rule_id)
    rules_to_remove = rules.where('rule_id = ?', rule_id)
    rules_to_remove.each do |rule|
      rules.delete(rule.id)
    end
  end

  def add_rule(target, points, type)
    rule_to_add = Rule.find_or_create_by(
      target: target,
      points: points,
      rule_type: type)
    rules << rule_to_add
  end

  def target_rules
    result = []
    rules.each do |rule|
      if rule.rule_type == TARGET_RULE
        result << rule
      end
    end
    result
  end

  def penalty_rules
    result = []
    rules.each do |rule|
      if rule.rule_type == PENALTY_RULE
        result << rule
      end
    end
    result
  end

  def modifier_rules
    result = []
    rules.each do |rule|
      if rule.rule_type == MODIFIER_RULE
        result << rule
      end
    end
    result
  end
end
