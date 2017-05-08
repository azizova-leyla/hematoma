class RuleSetController < ApplicationController
  before_action :set_rule_set

  def show
  end

  def remove_rule
    @rule_set.remove_rule(params[:rule_id])
    redirect_to @rule_set
  end

  def add_target_rule
    @rule_set.add_rule(
      params[:rule][:target],
      params[:rule][:points],
      false)
    redirect_to @rule_set
  end

  def add_penalty_rule
    @rule_set.add_rule(
      params[:rule][:target],
      params[:rule][:points],
      true)
    redirect_to @rule_set
  end

  private

  def set_rule_set
    @rule_set = RuleSet.find(params[:id])
  end
end
