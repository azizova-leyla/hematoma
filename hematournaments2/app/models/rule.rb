# == Schema Information
#
# Table name: rules
#
#  id         :integer          not null, primary key
#  target     :string
#  points     :integer
#  is_penalty :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rule < ApplicationRecord
  has_many :rule_set_rule,
    class_name: 'RuleSetRule',
    primary_key: :id,
    foreign_key: :rule_id
end