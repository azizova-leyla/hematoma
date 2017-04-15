# == Schema Information
#
# Table name: tournament_fighters
#
#  id            :integer          not null, primary key
#  tournament_id :integer          not null
#  fighter_id    :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class TournamentFighterTest < ActiveSupport::TestCase
  test "tournament name" do
     @tournament_fighter = tournament_fighters(:leyla_demas)
     assert_equal "Demas", @tournament_fighter.tournament_name
  end
  test "fighter name" do
    @tournament_fighter = tournament_fighters(:leyla_demas)
    assert_equal "Leyla Azizova, DEMAS", @tournament_fighter.fighter_name
  end
end
