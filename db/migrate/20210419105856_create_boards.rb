class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.string :related_object
      t.integer :related_object_id

      t.timestamps
    end
  end
end
