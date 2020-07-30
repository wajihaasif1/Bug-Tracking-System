class CreateBugs < ActiveRecord::Migration[6.0]
  def change
    create_table :bugs do |t|
      t.string :title
      t.datetime :deadline
      t.string :screenshot
      t.string :type
      t.string :status

      t.timestamps
    end
  end
end
