class MakeRuleSetTournamentOneToOne < ActiveRecord::Migration[5.0]
  def change
    remove_column :tournaments, :rule_set_id
    add_column :rule_sets, :tournament_id, :integer
  end
end
