# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :notification_type, null: false
      t.integer :viewable_permission, null: false
      t.integer :login_mode, null: false
      t.integer :link_type, null: false
      t.datetime :published_at, null: false
      t.string :title, null: false
      t.text :message
      t.references :company, foreign_key: true
      t.references :related_user, foreign_key: { to_table: :users }
      t.string :uid, null: false
      t.index :uid, unique: true
      t.string :related_object_uid
      t.index :related_object_uid
      t.text :description

      t.timestamps
    end
  end
end
