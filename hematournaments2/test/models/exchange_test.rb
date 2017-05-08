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
  # test "the truth" do
  #   assert true
  # end
end
