class CreateStaffs < ActiveRecord::Migration[6.1]
  def change
    create_table :staffs do |t|
      t.references :vendor_group, null: false, foreign_key: true
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true
      t.string :uid
      t.string :unique_key
      t.string :name
      t.string :phone
      t.string :email
      t.integer :status, default: 10, null: false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
