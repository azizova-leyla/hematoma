require 'test_helper'

class PoolsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pool = pools(:poolA)
    @tournament = tournaments(:demas)
  end

  test "should get index" do
    get pools_url(tournament_id: @tournament.id)
    assert_response :success
  end

  test "should get new" do
    get new_pool_url(tournament_id: @tournament.id)
    assert_response :success
  end

  test "should create pool" do
    assert_difference('Pool.count') do
      post pools_url(tournament_id: @tournament.id), params: { pool: { name: @pool.name, tournament_id: @pool.tournament_id } }
    end

    assert_redirected_to pool_url(tournament_id: @tournament.id, id: Pool.last.id)
  end

  test "should show pool" do
    get pool_url(tournament_id: @tournament.id, id: @pool.id)
    assert_response :success
  end

  test "should get edit" do
    get edit_pool_url(tournament_id: @tournament.id, id: @pool.id)
    assert_response :success
  end

  test "should update pool" do
    patch pool_url(tournament_id: @tournament.id, id: @pool.id), params: { pool: { name: @pool.name, tournament_id: @pool.tournament_id } }
    assert_redirected_to pool_url(tournament_id: @tournament.id, id: @pool.id)
  end

  test "should destroy pool" do
    assert_difference('Pool.count', -1) do
      delete pool_url(tournament_id: @tournament.id, id: @pool.id)
    end

    assert_redirected_to pools_url(tournament_id: @tournament.id)
  end
end