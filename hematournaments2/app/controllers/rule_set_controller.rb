class RuleSetController < ApplicationController
  before_action :set_rule_set
  def show
  end

  def remove_rule
    @rule_set.remove_rule(params[:rule_id])
  end

  def add_target_rule
    puts 'Adding target rule'
    puts @rule_set
    @rule_set.add_rule(
      target: params[:rule][:target],
      points: params[:rule][:points],
      is_penalty: false)
    redirect_to @rule_set
  end

  def add_penalty_rule
    puts 'Adding penalty rule'
    @rule_set.add_rule(
      target: params[:rule][:target],
      points: params[:rule][:points],
      is_penalty: true)
    redirect_to @rule_set
  end

private
  def set_rule_set
    @rule_set = RuleSet.find(params[:id])
  end
end
