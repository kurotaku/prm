class CreateLeadRawLabels < ActiveRecord::Migration[6.1]
  def change
    create_table :lead_raw_labels do |t|
      t.references :maker_group, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :contract_type, default: 10, null: false
      for str in "aa".."cc"
        t.string "col_" + str
      end

      t.timestamps
    end
  end
end
