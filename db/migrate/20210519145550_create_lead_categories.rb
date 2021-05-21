class CreateLeadCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :lead_categories do |t|
      t.references :maker_group, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.string :name
      t.string :slug
      t.integer :order

      t.timestamps
    end
  end
end
