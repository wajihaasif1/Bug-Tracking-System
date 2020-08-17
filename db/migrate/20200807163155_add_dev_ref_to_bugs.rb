class AddDevRefToBugs < ActiveRecord::Migration[6.0]
  def change
    add_column :bugs, :developer_id, :integer
  end
end
