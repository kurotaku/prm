# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.references :maker_group, null: false, foreign_key: true
      t.string "code"
      t.string "name"
      t.integer :price
      t.integer :incentive
      t.text "description"
      t.integer :status, default: 10, null: false
      t.string :uid
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
