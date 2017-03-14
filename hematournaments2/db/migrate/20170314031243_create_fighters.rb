class CreateFighters < ActiveRecord::Migration[5.0]
  def change
    create_table :fighters do |t|
      t.string :fist_name
      t.string :last_name
      t.string :club
      t.string :gender

      t.timestamps
    end
  end
end
