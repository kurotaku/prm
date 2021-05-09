# frozen_string_literal: true

class CreateUserProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :user_profiles do |t|
      t.references :user, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.integer :status, default: 10, null: false
      t.string :uid
      t.string :code
      t.string :name
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
