class CreatePoolFighters < ActiveRecord::Migration[5.0]
  def change
    create_table :pool_fighters do |t|
      t.integer :pool_id, :null => false
      t.integer :fighter_id, :null => false

      t.timestamps
    end
    add_index :pool_fighters, :pool_id
    add_index :pool_fighters, :fighter_id
    add_index :pool_fighters, [:pool_id, :fighter_id], unique: true
  end
end
