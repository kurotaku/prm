# frozen_string_literal: true

class CreatePartners < ActiveRecord::Migration[6.1]
  def change
    create_table :partners do |t|
      t.references :maker_group, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.integer :hierarchy
      t.references :parent, foreign_key: { to_table: :companies }
      t.text :maker_memo
      t.integer :status, default: 10, null: false
      t.string :uid
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
