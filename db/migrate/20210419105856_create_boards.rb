# frozen_string_literal: true

class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.references :vendor_group, null: false, foreign_key: true
      t.string :related_object
      t.string :related_object_uid
      t.string :uid

      t.timestamps
    end
  end
end
