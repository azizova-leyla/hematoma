# == Schema Information
#
# Table name: rule_set_rules
#
#  id          :integer          not null, primary key
#  rule_id     :integer          not null
#  rule_set_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class RuleSetRule < ApplicationRecord
  validates :rule_id, :rule_set_id, presence: true

  belongs_to :rule
  belongs_to :rule_set
end
