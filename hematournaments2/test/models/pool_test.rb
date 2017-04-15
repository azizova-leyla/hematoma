# == Schema Information
#
# Table name: pools
#
#  id            :integer          not null, primary key
#  tournament_id :integer          not null
#  name          :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class PoolTest < ActiveSupport::TestCase
  test "remove_fighter" do
    pool = pools(:poolA)
    fighter = fighters(:leyla)
    assert_includes(pool.fighters, fighter)
    assert_difference('PoolFighter.count', -1) do
      pool.remove_fighter(fighter.id)
    end
    assert (not pool.fighters.include? fighter)
  end

  test "add_new_fighter" do
    pool = pools(:poolA)
    fighter = fighters(:skye)
    assert_difference('PoolFighter.count') do
      pool.add_fighter(fighter.id)
    end
    assert_includes(pool.fighters, fighter)
  end

  test "create_matches_two_fighters" do
    pool = pools(:poolA)
    pool.fighters = [fighters(:leyla), fighters(:skye)]
    pool.create_matches
    assert_equal(1, pool.matches.count)
  end

  test "create_matches_three_fighters" do
    pool = pools(:poolA)
    pool.fighters = [fighters(:leyla), fighters(:skye), fighters(:yuriy)]
    pool.create_matches
    assert_equal(3, pool.matches.count)
  end

  test "create_matches_four_fighters" do
    pool = pools(:poolA)
    pool.fighters = [fighters(:leyla), fighters(:skye), fighters(:yuriy), fighters(:corey)]
    pool.create_matches
    assert_equal(6, pool.matches.count)
  end

end
