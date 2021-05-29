# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.references :maker_group, null: false, foreign_key: true
      t.string :code
      t.string :name
      t.string :image

      # agency(取次)
      t.integer :agency_price
      t.integer :agency_incentive
      t.text :agency_description
      # introduction(紹介)
      t.integer :introduction_price
      t.integer :introduction_incentive
      t.text :introduction_description
      # wholesale(卸売)
      t.integer :wholesale_price
      t.integer :wholesale_incentive
      t.text :wholesale_description

      t.integer :status, default: 10, null: false
      t.string :uid
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
