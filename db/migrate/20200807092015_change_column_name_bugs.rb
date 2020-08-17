class ChangeColumnNameBugs < ActiveRecord::Migration[6.0]
  def change
    rename_column :bugs, :type, :bug_type
  end
end
