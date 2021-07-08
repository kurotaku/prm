# frozen_string_literal: true

class AddColumnsSomeTables < ActiveRecord::Migration[6.1]
  def change
    change_table :contracts, bulk: true do |t|
      t.references :product, foreign_key: true
      t.references :company, foreign_key: true
      t.references :staff, foreign_key: true
    end

    change_table :staffs, bulk: true do |t|
      t.references :company, foreign_key: true
    end

    change_table :products, bulk: true do |t|
      t.references :company, foreign_key: true
      t.references :staff, foreign_key: true
      t.references :customer, foreign_key: true
    end

    change_table :customers, bulk: true do |t|
      t.references :lead, foreign_key: true
    end
  end
end
