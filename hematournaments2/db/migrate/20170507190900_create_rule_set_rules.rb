class CreateRuleSetRules < ActiveRecord::Migration[5.0]
  def change
    create_table :rule_set_rules do |t|
      t.integer :rule_set_id, null: false
      t.integer :rule_id, null: false
      t.timestamps
    end
    add_index :rule_set_rules, :rule_set_id
    add_index :rule_set_rules, :rule_id
    add_index :rule_set_rules, [:rule_set_id, :rule_id], unique: true
  end
end
