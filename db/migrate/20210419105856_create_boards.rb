# frozen_string_literal: true

class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.string :related_object
      t.string :related_object_uid
      t.integer :status, default: 10, null: false
      t.string :uid

      t.timestamps
    end
  end
end
