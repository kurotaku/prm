# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :board, null: false, foreign_key: true
      t.references :staff, null: false, foreign_key: true
      t.text :content
      t.integer :status, default: 10, null: false
      t.string :uid

      t.timestamps
    end
  end
end
