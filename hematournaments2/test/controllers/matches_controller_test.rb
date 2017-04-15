require 'test_helper'

class MatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @leyla = fighters(:leyla)
    @yuriy = fighters(:yuriy)
    @corey = fighters(:corey)
    @tournament = tournaments(:demas)
    @pool = pools(:poolA)
    @match = @pool.matches.create(order: 2, red_fighter_id: @corey.id, blue_fighter_id: @leyla.id)
  end

  test "should get index" do
    get matches_url(tournament_id: @tournament.id, pool_id: @pool.id)
    assert_response :success
  end

  test "should get new" do
    get new_match_url(tournament_id: @tournament.id, pool_id: @pool.id)
    assert_response :success
  end

  test "should create match" do
    assert_difference('Match.count') do
      post matches_url(tournament_id: @tournament.id, pool_id: @pool.id),
                      params: {
                        match: {
                          blue_fighter_id: @leyla.id,
                          order: 1,
                          red_fighter_id: @yuriy.id
                        }
                      }
    end

    assert_redirected_to match_url(tournament_id: @tournament.id, pool_id: @pool.id, id: Match.last.id)
  end

  test "should show match" do
    get match_url(tournament_id: @tournament.id, pool_id: @pool.id, id: @match)
    assert_response :success
  end

  test "should get edit" do
    get edit_match_url(tournament_id: @tournament.id, pool_id: @pool.id, id: @match)
    assert_response :success
  end

  test "should update match" do
    patch match_url(tournament_id: @tournament.id, pool_id: @pool.id, id: @match), params: { match: { blue_fighter_id: @yuriy.id, order: 1, pool_id: @pool.id, red_fighter_id: @leyla.id } }
    assert_redirected_to match_url(tournament_id: @tournament.id, pool_id: @pool.id, id: @match)
  end

  test "should destroy match" do
    assert_difference('Match.count', -1) do
      delete match_url(tournament_id: @tournament.id, pool_id: @pool.id, id: @match)
    end

    assert_redirected_to matches_url(tournament_id: @tournament.id, pool_id: @pool.id)
  end
end
