class AddTournamentFighterIndex < ActiveRecord::Migration[5.0]
  def change
    change_column :tournament_fighters, :tournament_id, :integer, :null => false
    change_column :tournament_fighters, :fighter_id, :integer, :null => false
    add_index :tournament_fighters, :tournament_id
    add_index :tournament_fighters, :fighter_id
    add_index :tournament_fighters, [:tournament_id, :fighter_id], unique: true
  end
end
