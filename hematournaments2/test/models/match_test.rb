# == Schema Information
#
# Table name: matches
#
#  id              :integer          not null, primary key
#  pool_id         :integer          not null
#  order           :integer          not null
#  red_fighter_id  :integer          not null
#  blue_fighter_id :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
