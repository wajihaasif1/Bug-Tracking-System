class AddProjectRefToBugs < ActiveRecord::Migration[6.0]
  def change
    add_reference :bugs, :project, null: false, foreign_key: true
  end
end
