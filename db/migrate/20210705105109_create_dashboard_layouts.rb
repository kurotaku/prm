# frozen_string_literal: true

class CreateDashboardLayouts < ActiveRecord::Migration[6.1]
  def change
    create_table :dashboard_layouts do |t|
      t.references :dashboard, null: false, foreign_key: true
      t.json :layout

      t.timestamps
    end
  end
end
