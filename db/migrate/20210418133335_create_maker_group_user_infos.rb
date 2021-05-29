# frozen_string_literal: true

class CreateMakerGroupUserInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :maker_group_user_infos do |t|
      t.references :maker_group, null: false, foreign_key: true
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true
      t.references :partner, foreign_key: true
      t.string :uid
      t.string :unique_key
      t.string :name
      t.string :phone
      t.string :email
      t.integer :status, default: 10, null: false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
