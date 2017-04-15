require 'test_helper'

class TournamentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tournament = tournaments(:demas)
  end

  test "should get index" do
    get tournaments_url
    assert_response :success
  end

  test "should get new" do
    get new_tournament_url
    assert_response :success
  end

  test "should create tournament" do
    assert_difference('Tournament.count') do
      post tournaments_url, params: { tournament: { date: @tournament.date, name: 'Test tournament', weapon: @tournament.weapon } }
    end

    assert_redirected_to tournament_url(Tournament.last)
  end

  test "should show tournament" do
    get tournament_url(@tournament)
    assert_response :success
  end

  test "should get edit" do
    get edit_tournament_url(@tournament)
    assert_response :success
  end

  test "should update tournament" do
    patch tournament_url(@tournament), params: {
      tournament: {
        date: @tournament.date,
        name: @tournament.name,
        weapon: @tournament.weapon
      }
    }
    assert_redirected_to tournament_url(@tournament)
  end

  test "should destroy tournament" do
    assert_difference('Tournament.count', -1) do
      delete tournament_url(@tournament)
    end

    assert_redirected_to tournaments_url
  end

  test "should remove fighter" do
    assert_difference('TournamentFighter.count', -1) do
      delete tournaments_remove_fighter_path(@tournament), params: { fighter_id: fighters(:leyla).id }
    end
    assert_redirected_to tournament_url(@tournament)
  end

  test "should add new fighter" do
    assert_difference('TournamentFighter.count') do
      post tournaments_add_fighter_path(@tournament), params: {
        fighter: { first_name: 'testname', last_name: 'lastname'} }
    end
    assert_redirected_to tournament_url(@tournament)
  end

  test "should add new fighter with club" do
    assert_difference('TournamentFighter.count') do
      post tournaments_add_fighter_path(@tournament), params: {
        fighter: {
          first_name: 'testname',
          last_name: 'lastname',
          club: 'testclub'
        }
      }
    end
    assert_redirected_to tournament_url(@tournament)
  end

  test "should add existing fighter" do
    assert_difference('TournamentFighter.count') do
      post tournaments_add_fighter_path(@tournament), params: {
       fighter: {
        first_name: 'Skye',
        last_name: 'Hilton'
        }
      }
    end
    assert_redirected_to tournament_url(@tournament)
  end

  test "should not add duplicate" do
    fighter = fighters(:leyla)
    assert_no_difference('TournamentFighter.count') do
      post tournaments_add_fighter_path(@tournament), params: { fighter: { first_name: fighter.first_name, last_name: fighter.last_name} }
    end
    assert_redirected_to tournament_url(@tournament)
  end
end
