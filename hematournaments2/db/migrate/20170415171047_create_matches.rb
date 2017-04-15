class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :pool_id, null: false
      t.integer :order, null: false
      t.integer :red_fighter_id, null: false
      t.integer :blue_fighter_id, null: false

      t.timestamps
    end
    add_index :matches, :pool_id
    add_index :matches, :red_fighter_id
    add_index :matches, :blue_fighter_id
  end
end
