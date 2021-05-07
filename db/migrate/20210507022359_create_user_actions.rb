# frozen_string_literal: true

class CreateUserActions < ActiveRecord::Migration[6.1]
  def change
    create_table :user_actions do |t|
      t.string :ctrl_path
      t.string :act_path
      t.string :name

      t.timestamps
    end
  end
end
