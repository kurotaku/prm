# frozen_string_literal: true

class CreateAgentProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :agent_products do |t|
      t.references :maker_group, null: false, foreign_key: true
      t.references :vendor_group, null: false, foreign_key: true
      t.references :agent, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :price
      t.integer :incentive
      t.integer :status, default: 10, null: false
      t.string :uid

      t.timestamps
    end
  end
end
