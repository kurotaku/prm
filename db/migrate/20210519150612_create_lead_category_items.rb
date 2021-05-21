class CreateLeadCategoryItems < ActiveRecord::Migration[6.1]
  def change
    create_table :lead_category_items do |t|
      t.references :lead_category, null: false, foreign_key: true
      t.string :name
      t.string :slug
      t.integer :order

      t.timestamps
    end
  end
end
