# frozen_string_literal: true

class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :name_kana
      t.string :coprate_number
      t.string :postcode
      t.string :address
      t.string :address2
      t.string :phone
      t.string :image
      t.string :email
      t.integer :partnership_type, default: 10, null: false
      t.string :uid
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
