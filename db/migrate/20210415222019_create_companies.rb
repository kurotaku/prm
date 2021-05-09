# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.references :prefecture, foreign_key: true
      t.string "name"
      t.string "name_kana"
      t.string :coprate_number
      t.string "postcode"
      t.string "address"
      t.string "address2"
      t.string "phone"
      t.string "fax"
      t.integer "settlement_month"
      t.string "image"
      t.string "email"
      t.integer :status, default: 10, null: false
      t.integer :contract_type, default: 10, null: false
      t.string "uid"
      t.datetime "deleted_at"

      t.timestamps
    end
  end
end
