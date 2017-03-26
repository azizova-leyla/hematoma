class Datetype < ActiveRecord::Migration[5.0]
  def change
    change_column :tournaments, :date, :datetime, :null => false
  end
end
