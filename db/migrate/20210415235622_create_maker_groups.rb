# frozen_string_literal: true

class CreateMakerGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :maker_groups do |t|
      t.references :maker, null: false, foreign_key: { to_table: :companies }
      t.integer :status, default: 10, null: false
      t.string :uid
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
