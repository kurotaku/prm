# frozen_string_literal: true

class CreateLeadPhases < ActiveRecord::Migration[6.1]
  def change
    create_table :lead_phases do |t|
      t.references :vendor_group, null: false, foreign_key: true
      t.string :name
      t.integer :position
      t.integer :phase_role

      t.timestamps
    end
  end
end
