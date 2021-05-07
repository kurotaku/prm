# frozen_string_literal: true

class CreateVendorInformations < ActiveRecord::Migration[6.1]
  def change
    create_table :vendor_informations do |t|
      t.references :maker_group, null: false, foreign_key: true
      t.references :vendor_group, null: false, foreign_key: true
      t.string :title
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.integer :status, default: 10, null: false
      t.string :uid

      t.timestamps
    end
  end
end
