class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.references :vendor_group, null: false, foreign_key: true
      t.references :organization
      t.string :name
      t.string :address
      t.string :address2
      t.string :phone
      t.integer :hierarchy, default: 1
      t.references :parent, foreign_key: { to_table: :companies }
      t.text :vendor_memo
      t.integer :contract_type, default: 10, null: false
      t.integer :status, default: 10, null: false
      t.string :uid
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
