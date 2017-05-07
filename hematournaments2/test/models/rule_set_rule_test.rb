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

require 'test_helper'

class RuleSetRuleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
