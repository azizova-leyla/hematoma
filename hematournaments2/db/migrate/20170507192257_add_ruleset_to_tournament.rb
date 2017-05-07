class AddRulesetToTournament < ActiveRecord::Migration[5.0]
  def change
    add_column :tournaments, :rule_set_id, :integer
  end
end
