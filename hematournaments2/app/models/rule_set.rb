# == Schema Information
#
# Table name: rule_sets
#
#  id          :integer          not null, primary key
#  description :string
#  weapon      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
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

  def remove_rule(rule_id)
    rules_to_remove = rule_set_rules.where(rule_id: rule_id)
    rules_to_remove.each do |rule|
      rule.destroy
    end
  end

  def add_rule(target, points, is_penalty)
    existing_rule = rules.where(target: target, points: points, is_penalty: is_penalty)
    if existing_rule.any?
      rules << existing_rule[0]
    else
      rules.create(target: target, points: points, is_penalty: is_penalty)
    end
  end
end
