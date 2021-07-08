# frozen_string_literal: true

class CreateTableColumnSelectItems < ActiveRecord::Migration[6.1]
  def change
    create_table :table_column_select_items do |t|
      t.string :uid

      t.references :table_column, null: false, foreign_key: true
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
