class AddCreatorRefToBugs < ActiveRecord::Migration[6.0]
  def change
    add_reference :bugs, :creator, null: false, foreign_key: {to_table: :users}
  end
end
