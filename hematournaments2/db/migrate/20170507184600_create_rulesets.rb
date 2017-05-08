class CreateRulesets < ActiveRecord::Migration[5.0]
  def change
    create_table :rulesets do |t|
      t.string :description
      t.string :weapon
      t.timestamps
    end
    add_index :rulesets, :id
  end
end
