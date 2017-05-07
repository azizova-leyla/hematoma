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

require 'test_helper'

class RulesetTest < ActiveSupport::TestCase
  test "remove_rule" do
    rule_set = rule_sets(:demas)
    rule = rule_set.rules[0]
    assert_difference('RuleSetRule.count', -1) do
      rule_set.remove_rule(rule.id)
    end
    assert_not_includes(rule_set.rules, rule)
  end

  test "add_new_rule" do
    rule_set = rule_sets(:demas)
    assert_difference(['RuleSetRule.count', 'Rule.count']) do
      rule_set.add_rule("Torso", 3, false)
    end
  end

  test "add_existing_rule" do
    rule_set = rule_sets(:demas)
    rule = rules(:double)
    assert_no_difference('Rule.count') do
      assert_difference(['RuleSetRule.count']) do
        rule_set.add_rule(rule.target, rule.points, rule.is_penalty)
      end
    end
  end
end
