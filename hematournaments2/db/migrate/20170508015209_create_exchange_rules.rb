class CreateExchangeRules < ActiveRecord::Migration[5.0]
  def change
    create_table :exchange_rules do |t|
      t.integer :exchange_id, null: false
      t.integer :rule_id, null: false
      t.integer :fighter_id, null: false
      t.timestamps
    end
    add_index :exchange_rules, :exchange_id
    add_index :exchange_rules, :rule_id
    add_index :exchange_rules, :fighter_id
    add_index :exchange_rules, [:exchange_id, :rule_id], unique: true
  end
end
