# == Schema Information
#
# Table name: exchange_rules
#
#  id          :integer          not null, primary key
#  exchange_id :integer          not null
#  rule_id     :integer          not null
#  fighter_id  :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ExchangeRuleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
