class ChangeFighterFirstName < ActiveRecord::Migration[5.0]
  def change
    rename_column :fighters, :fist_name, :first_name
  end
end
