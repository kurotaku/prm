# frozen_string_literal: true

class CreateGadgets < ActiveRecord::Migration[6.1]
  def change
    create_table :gadgets do |t|
      t.references :dashboard, null: false, foreign_key: true

      t.string :uid

      t.string :name

      t.integer :chart_type, default: 10, null: false

      t.integer :target_table, default: 10, null: false
      t.integer :row_group
      t.integer :col_group
      t.references :target_column, foreign_key: { to_table: :table_columns }

      t.timestamps
    end
  end
end
