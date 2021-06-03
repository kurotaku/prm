# frozen_string_literal: true

class CreateSharedFiles < ActiveRecord::Migration[6.1]
  def change
    create_table :shared_files do |t|
      t.references :vendor_group, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :uid
      t.string :file
      t.string :file_name
      t.string :name
      t.string :human_size
      t.integer :file_size

      t.timestamps
    end
  end
end
