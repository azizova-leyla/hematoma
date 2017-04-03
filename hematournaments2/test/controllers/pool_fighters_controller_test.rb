require 'test_helper'

class PoolFightersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pool_fighter = pool_fighters(:leyla_poolA)
    @poolB = pools(:poolB)
    @leyla = fighters(:leyla)
  end

  test "should get index" do
    get pool_fighters_url
    assert_response :success
  end

  test "should get new" do
    get new_pool_fighter_url
    assert_response :success
  end

  test "should create pool_fighter" do
    assert_difference('PoolFighter.count') do
      post pool_fighters_url, params: { pool_fighter: { fighter_id: @leyla.id, pool_id: @poolB.id } }
    end

    assert_redirected_to pool_fighter_url(PoolFighter.last)
  end

  test "should show pool_fighter" do
    get pool_fighter_url(@pool_fighter)
    assert_response :success
  end

  test "should get edit" do
    get edit_pool_fighter_url(@pool_fighter)
    assert_response :success
  end

  test "should update pool_fighter" do
    patch pool_fighter_url(@pool_fighter), params: { pool_fighter: { fighter_id: @pool_fighter.fighter_id, pool_id: @poolB.id } }
    assert_redirected_to pool_fighter_url(@pool_fighter)
  end

  test "should destroy pool_fighter" do
    assert_difference('PoolFighter.count', -1) do
      delete pool_fighter_url(@pool_fighter)
    end

    assert_redirected_to pool_fighters_url
  end
end
