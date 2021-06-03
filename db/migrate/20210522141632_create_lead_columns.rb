# frozen_string_literal: true

class CreateLeadColumns < ActiveRecord::Migration[6.1]
  def change
    create_table :lead_columns do |t|
      t.string :name
      t.string :key_name
      t.string :lead_attribute
      t.references :vendor_group, null: false, foreign_key: true
      t.integer :contract_type, default: 10, null: false
      t.integer :data_type, default: 10, null: false
      t.integer :order, null: false
      t.integer :index_page_order

      t.timestamps
    end
  end
end
