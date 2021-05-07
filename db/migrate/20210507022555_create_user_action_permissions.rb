# frozen_string_literal: true

class CreateUserActionPermissions < ActiveRecord::Migration[6.1]
  def change
    create_table :user_action_permissions do |t|
      t.references :company, null: false, foreign_key: true
      t.references :user_action, null: false, foreign_key: true
      t.integer :permit_role

      t.timestamps
    end
  end
end
