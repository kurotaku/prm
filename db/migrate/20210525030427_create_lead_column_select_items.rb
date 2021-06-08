# frozen_string_literal: true

class CreateLeadColumnSelectItems < ActiveRecord::Migration[6.1]
  def change
    create_table :lead_column_select_items do |t|
      t.references :lead_column, null: false, foreign_key: true
      t.string :name
      t.integer :order

      t.timestamps
    end
  end
end
