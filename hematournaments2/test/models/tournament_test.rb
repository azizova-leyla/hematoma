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
    @tournament = tournaments(:demas)
    @fighter = fighters(:leyla)
    assert_includes(@tournament.fighters, @fighter)
    assert_difference('TournamentFighter.count', -1) do
      @tournament.remove_fighter(@fighter.id)
    end
    assert (not @tournament.fighters.include? @fighter)
  end

  test "add_new_fighter" do
    @tournament = tournaments(:tosetti)
    assert_difference(['TournamentFighter.count', 'Fighter.count']) do
      @tournament.add_or_create_fighter("Steaphen", "Fick")
    end
  end
  test "add_existing_fighter" do
    @tournament = tournaments(:tosetti)
    assert_no_difference('Fighter.count') do
      assert_difference('TournamentFighter.count') do
        @tournament.add_or_create_fighter("Leyla", "Azizova")
      end
    end
  end
end
