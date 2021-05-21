# frozen_string_literal: true

class CreateVendorGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :vendor_groups do |t|
      t.references :maker_group, null: false, foreign_key: true
      t.references :vendor, null: false, foreign_key: { to_table: :partners }
      t.references :product, null: false, foreign_key: true
      t.string :product_name
      t.integer :price
      t.integer :incentive
      t.integer :contract_type, default: 10, null: false
      t.integer :layer
      t.integer :status, default: 10, null: false
      t.text :description
      t.text :maker_memo
      t.date :contracted_at
      t.integer :settlement_month
      t.string :uid
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
