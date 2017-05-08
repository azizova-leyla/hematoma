class RenameRuleSet < ActiveRecord::Migration[5.0]
  def change
    rename_table :rulesets, :rule_sets
  end
end
