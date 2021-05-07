# frozen_string_literal: true

class CreateProductLabels < ActiveRecord::Migration[6.1]
  def change
    create_table :product_labels do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :order
      t.string :name

      t.timestamps
    end
  end
end
