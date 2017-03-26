class AddValidations < ActiveRecord::Migration[5.0]
  def change
    change_column :fighters, :first_name, :string, :null => false
    add_index :fighters, [:first_name, :last_name], unique: true

    change_column :tournaments, :name, :string, :null => false
    change_column :tournaments, :date, :string, :null => false
    change_column :tournaments, :weapon, :string, :null => false
    add_index :tournaments, :date
    add_index :tournaments, :name
    add_index :tournaments, [:name, :date], unique: true
  end
end
