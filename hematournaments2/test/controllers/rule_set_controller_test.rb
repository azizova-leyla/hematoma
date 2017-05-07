require 'test_helper'

class RuleSetControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rule_set = rule_sets(:demas)
    @existing_rule = rules(:head)
  end

  test "should show rule_set" do
    # get rule_set_url(@rule_set)
    # assert_response :success
  end

  test "should remove rule" do
    # assert_difference('RuleSetRule.count', -1) do
    #   delete remove_rule_path(@rule_set), params: { rule_id: @existing_rule.id }
    # end
    # assert_redirected_to rule_set_url(@rule_set)
  end

  test "should add target rule" do
    # assert_difference('RuleSetRule.count') do
    #   post add_target_rule_path(@rule_set), params: {
    #     rule: { target: 'testtarget', points: 2} }
    # end
    # rule = Rule.last
    # assert_equal('testtarget', rule.target)
    # assert_equal(2, rule.points)
    # assert_false(rule.is_penalty)
    # assert_redirected_to rule_set_url(@rule_set)
  end

  test "should add penalty rule" do
    # assert_difference('RuleSetRule.count') do
    #   post add_penalty_rule_path(@rule_set), params: {
    #     rule: { target: 'testpenalty', points: 0} }
    # end
    # rule = Rule.last
    # assert_equal('testpenalty', rule.penalty)
    # assert_equal(0, rule.points)
    # assert_true(rule.is_penalty)
    # assert_redirected_to rule_set_url(@rule_set)
  end

end
