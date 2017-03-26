require 'test_helper'

class TournamentFighterTest < ActiveSupport::TestCase
  test "tournament name" do
     @tournament_fighter = tournament_fighters(:leyla_demas)
     assert_equal "Demas", @tournament_fighter.tournament_name
  end
  test "fighter name" do
    @tournament_fighter = tournament_fighters(:leyla_demas)
    assert_equal "Leyla Azizova", @tournament_fighter.fighter_name
  end
end
