class CreateExchanges < ActiveRecord::Migration[5.0]
  def change
    create_table :exchanges do |t|
      t.integer :match_id, null: false
      t.integer :scoring_fighter_id, null: false
      t.integer :order_in_match, null: false
      t.timestamps
    end
    add_index :exchanges, :match_id
    add_index :exchanges, :scoring_fighter_id
  end
end
