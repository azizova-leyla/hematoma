class RenameToRuleType < ActiveRecord::Migration[5.0]
  def change
    rename_column :rules, :type, :rule_type
  end
end
