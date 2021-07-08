# frozen_string_literal: true

class CreateDashboards < ActiveRecord::Migration[6.1]
  def change
    create_table :dashboards do |t|
      t.references :vendor_group, null: false, foreign_key: true
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
