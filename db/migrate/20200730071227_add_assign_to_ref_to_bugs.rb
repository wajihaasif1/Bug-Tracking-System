class AddAssignToRefToBugs < ActiveRecord::Migration[6.0]
  def change
    add_reference :bugs, :assign_to, null: false, foreign_key: {to_table: :users}
  end
end
