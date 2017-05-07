class CreateRules < ActiveRecord::Migration[5.0]
  def change
    create_table :rules do |t|
      t.string :target, null: false
      t.integer :points, null: false
      t.boolean :is_penalty
      t.timestamps
    end
    add_index :rules, :id
  end
end
