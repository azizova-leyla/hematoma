# == Schema Information
#
# Table name: pool_fighters
#
#  id         :integer          not null, primary key
#  pool_id    :integer          not null
#  fighter_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PoolFighterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
