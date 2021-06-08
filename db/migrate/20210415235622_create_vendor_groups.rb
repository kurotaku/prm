# frozen_string_literal: true

class CreateVendorGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :vendor_groups do |t|
      t.references :vendor_organization, null: false, foreign_key: { to_table: :organizations }
      t.integer :status, default: 10, null: false
      t.string :name
      t.string :uid
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
