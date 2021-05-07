# frozen_string_literal: true

class CreateOfferMetas < ActiveRecord::Migration[6.1]
  def change
    create_table :offer_metas do |t|
      t.references :offer, null: false, foreign_key: true
      t.string :meta_key
      t.string :meta_label
      t.string :meta_value
      t.integer :order

      t.timestamps
    end
  end
end
