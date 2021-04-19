class CreateVendorInformations < ActiveRecord::Migration[6.1]
  def change
    create_table :vendor_informations do |t|
      t.references :maker_group, null: false, foreign_key: true
      t.references :vendor_group, null: false, foreign_key: true
      t.string :title
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
