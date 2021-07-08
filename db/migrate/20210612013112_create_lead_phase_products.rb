# frozen_string_literal: true

class CreateLeadPhaseProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :lead_phase_products do |t|
      t.references :lead_phase, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
