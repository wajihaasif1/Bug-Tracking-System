class AddCreatorRefToBugs < ActiveRecord::Migration[6.0]
  def change
    add_column :bugs, :creator_id, :integer
  end
end
