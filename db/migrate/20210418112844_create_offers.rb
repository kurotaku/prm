# frozen_string_literal: true

class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.references :maker_group, null: false, foreign_key: true
      t.references :vendor_group, null: false, foreign_key: true
      t.references :agent, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :type
      t.datetime :saled_at
      t.datetime :confirmed_at
      t.integer :progress
      t.string :unique_key
      t.integer :status, default: 10, null: false
      t.string :uid

      t.timestamps
    end
  end
end
