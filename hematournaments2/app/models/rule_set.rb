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
    rules_to_remove = rules.where('rule_id = ?', rule_id)
    rules_to_remove.each do |rule|
      rules.delete(rule.id)
    end
  end

  def add_rule(target, points, is_penalty)
    rule_to_add = Rule.find_or_create_by(target: target, points: points, is_penalty: is_penalty)
    rules << rule_to_add
  end
end