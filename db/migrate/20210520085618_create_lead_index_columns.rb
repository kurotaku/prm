class CreateLeadIndexColumns < ActiveRecord::Migration[6.1]
  def change
    create_table :lead_index_columns do |t|
      t.string :name
      t.string :lead_column
      t.references :product, null: false, foreign_key: true
      t.integer :contract_type, default: 10, null: false
      t.integer :data_type, default: 10, null: false
      t.references :lead_category, foreign_key: true
      t.integer :order, default: 1, null: false

      t.timestamps
    end
  end
end
