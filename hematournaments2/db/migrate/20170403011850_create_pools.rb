class CreatePools < ActiveRecord::Migration[5.0]
  def change
    create_table :pools do |t|
      t.integer :tournament_id
      t.string :name

      t.timestamps
    end
    add_index :pools, :tournament_id
  end
end
