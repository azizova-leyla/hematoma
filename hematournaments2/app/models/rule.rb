# == Schema Information
#
# Table name: rules
#
#  id         :integer          not null, primary key
#  target     :string           not null
#  points     :integer          not null
#  is_penalty :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  rule_type  :string
#

class Rule < ApplicationRecord
  has_many :rule_set_rule,
    class_name: 'RuleSetRule',
    primary_key: :id,
    foreign_key: :rule_id
  has_many :exchange_rules,
    class_name: 'ExchangeRule',
    primary_key: :id,
    foreign_key: :rule_id
end
