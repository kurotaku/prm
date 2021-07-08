# frozen_string_literal: true

class CreateCsvImportHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :csv_import_histories do |t|
      t.references :staff, foreign_key: true
      t.references :vendor_group, null: false, foreign_key: true
      t.integer :related_object, default: 10, null: false
      t.string :file_name
      t.text :cache

      t.timestamps
    end
  end
end
