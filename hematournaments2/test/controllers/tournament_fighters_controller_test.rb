require 'test_helper'

class TournamentFightersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tournament_fighter = tournament_fighters(:leyla_demas)
    @tournament = tournaments(:tosetti)
    @fighter = fighters(:yuriy)
  end

  test "should get index" do
    get tournament_fighters_url
    assert_response :success
  end

  test "should get new" do
    get new_tournament_fighter_url
    assert_response :success
  end

  test "should create tournament_fighter" do
    assert_difference('TournamentFighter.count') do
      post tournament_fighters_url, params: { tournament_fighter: { fighter_id: @fighter.id, tournament_id: @tournament.id } }
    end

    assert_redirected_to tournament_fighter_url(TournamentFighter.last)
  end

  test "should show tournament_fighter" do
    get tournament_fighter_url(@tournament_fighter)
    assert_response :success
  end

  test "should get edit" do
    get edit_tournament_fighter_url(@tournament_fighter)
    assert_response :success
  end

  test "should update tournament_fighter" do
    patch tournament_fighter_url(@tournament_fighter), params: { tournament_fighter: { fighter_id: @tournament_fighter.fighter_id, tournament_id: @tournament_fighter.tournament_id } }
    assert_redirected_to tournament_fighter_url(@tournament_fighter)
  end

  test "should destroy tournament_fighter" do
    assert_difference('TournamentFighter.count', -1) do
      delete tournament_fighter_url(@tournament_fighter)
    end

    assert_redirected_to tournament_fighters_url
  end
end
