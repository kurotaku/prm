class CreateLeads < ActiveRecord::Migration[6.1]
  def change
    create_table :leads do |t|
      t.references :maker_group, null: false, foreign_key: true
      t.references :partner, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :contract_type, default: 10, null: false
      t.integer :progress
      t.index :progress
      t.text :index_cache
      t.text :show_cache
      
      t.references :category_1, foreign_key: { to_table: :lead_category_items }
      t.references :category_2, foreign_key: { to_table: :lead_category_items }
      t.references :category_3, foreign_key: { to_table: :lead_category_items }
      t.references :category_4, foreign_key: { to_table: :lead_category_items }
      t.references :category_5, foreign_key: { to_table: :lead_category_items }
      t.datetime :datetime_1
      t.datetime :datetime_2
      t.datetime :datetime_3
      t.datetime :datetime_4
      t.datetime :datetime_5
      t.string :string_1
      t.string :string_2
      t.string :string_3
      t.string :string_4
      t.string :string_5
      t.text :text_1
      t.text :text_2
      t.text :text_3
      t.text :text_4
      t.text :text_5
      t.integer :integer_1
      t.integer :integer_2
      t.integer :integer_3
      t.integer :integer_4
      t.integer :integer_5
      t.references :prefecture_1, foreign_key: { to_table: :prefectures }

      t.timestamps
    end
  end
end
