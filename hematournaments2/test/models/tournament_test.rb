# == Schema Information
#
# Table name: tournaments
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  date       :datetime         not null
#  weapon     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TournamentTest < ActiveSupport::TestCase
  test "remove_fighter" do
    tournament = tournaments(:demas)
    fighter = fighters(:leyla)
    assert_includes(tournament.fighters, fighter)
    assert_difference('TournamentFighter.count', -1) do
      tournament.remove_fighter(fighter.id)
    end
    assert(!tournament.fighters.include?(fighter))
  end

  test "add_new_fighter" do
    tournament = tournaments(:tosetti)
    assert_difference(['TournamentFighter.count', 'Fighter.count']) do
      tournament.add_or_create_fighter("Steaphen", "Fick", "DEMAS")
    end
  end

  test "add_new_fighter_no_club" do
    tournament = tournaments(:tosetti)
    assert_difference(['TournamentFighter.count', 'Fighter.count']) do
      tournament.add_or_create_fighter("Steaphen", "Fick")
    end
  end

  test "add_existing_fighter" do
    tournament = tournaments(:tosetti)
    assert_no_difference('Fighter.count') do
      assert_difference('TournamentFighter.count') do
        tournament.add_or_create_fighter("Leyla", "Azizova", "DEMAS")
      end
    end
  end

  test "reassign_not_assigned_fighter" do
    tournament = tournaments(:tosetti)
    pool = tournament.pools.create(name: "PoolA")
    fighter = fighters(:skye)

    tournament.reassign_fighters_to_pool([fighter.id], pool.id)
    assert_includes(pool.fighters, fighter)
  end

  test "reassign_assigned_fighter" do
    tournament = tournaments(:tosetti)
    poolA = tournament.pools.create(name: "PoolA")
    poolB = tournament.pools.create(name: "PoolB")
    fighter = fighters(:skye)
    poolA.add_fighter(fighter.id)

    tournament.reassign_fighters_to_pool([fighter.id], poolB.id)
    assert_includes(poolB.fighters, fighter)
  end

  test "not_assigned_fighters" do
    tournament = tournaments(:tosetti)
    pool = tournament.pools.create(name: "PoolA")
    fighter = fighters(:skye)
    assert_no_difference('Fighter.count') do
      tournament.add_existing_fighter(fighter)
    end
    assert_includes(tournament.not_assigned_fighters, fighter)

    pool.add_fighter(fighter.id)
    assert_includes(pool.fighters, fighter)
    assert(!tournament.not_assigned_fighters.include?(fighter))
  end
end
