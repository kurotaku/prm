# frozen_string_literal: true

class CreateTableColumns < ActiveRecord::Migration[6.1]
  def change
    create_table :table_columns do |t|
      t.string :uid

      t.references :vendor_group, null: false, foreign_key: true
      t.boolean :default_column, default: false
      t.integer :table_type, default: 10, null: false
      t.integer :data_type, default: 0, null: false

      t.string :name
      t.string :key_name
      t.string :table_attribute

      t.integer :stack_type
      t.integer :target_table
      t.references :target_column, foreign_key: { to_table: :table_columns }

      t.integer :position, null: false
      t.integer :index_page_position

      t.timestamps
    end
  end
end
