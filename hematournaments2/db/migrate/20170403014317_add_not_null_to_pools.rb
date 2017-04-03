class AddNotNullToPools < ActiveRecord::Migration[5.0]
  def change
    change_column :pools, :tournament_id, :integer, :null => false
    change_column :pools, :name, :string, :null => false
  end
end
