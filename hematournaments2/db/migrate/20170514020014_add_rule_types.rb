class AddRuleTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :rules, :type, :string
  end
end
