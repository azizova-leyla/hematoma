class CreateTournamentFighters < ActiveRecord::Migration[5.0]
  def change
    create_table :tournament_fighters do |t|
      t.integer :tournament_id
      t.integer :fighter_id

      t.timestamps
    end
  end
end
