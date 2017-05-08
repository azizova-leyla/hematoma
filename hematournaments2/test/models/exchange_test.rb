# == Schema Information
#
# Table name: exchanges
#
#  id                 :integer          not null, primary key
#  match_id           :integer          not null
#  scoring_fighter_id :integer          not null
#  order_in_match     :integer          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class ExchangeTest < ActiveSupport::TestCase
  test "returns_scoring_color" do
    exchange = exchanges(:one)
    assert_equal('Red', exchange.scoring_color)
  end

  test "returns_not_scoring_color" do
    exchange = exchanges(:one)
    assert_equal('Blue', exchange.not_scoring_color)
  end

  test "returns_target" do
    exchange = exchanges(:one)
    assert_equal('Head(+4)', exchange.target)
  end

  test "returns_total_points" do
    exchange = exchanges(:one)
    assert_equal(4, exchange.total_points)
  end

end
