# frozen_string_literal: true

class CreateProductMetas < ActiveRecord::Migration[6.1]
  def change
    create_table :product_metas do |t|
      t.references :product, null: false, foreign_key: true
      t.string :meta_key
      t.string :meta_label
      t.string :meta_type
      t.integer :order

      t.timestamps
    end
  end
end
