# frozen_string_literal: true

class CreateLeads < ActiveRecord::Migration[6.1]
  def change
    create_table :leads do |t|
      t.references :maker_group, null: false, foreign_key: true
      t.references :partner, foreign_key: true
      t.references :product, foreign_key: true
      t.string :unique_key
      t.index [:unique_key, :product_id], unique: true
      t.integer :contract_type, default: 10, null: false
      t.integer :progress
      t.index :progress
      t.text :index_cache
      t.text :show_cache

      t.references :user_info_partner_1, foreign_key: { to_table: :maker_group_user_infos }
      t.references :user_info_partner_2, foreign_key: { to_table: :maker_group_user_infos }
      t.references :user_info_partner_3, foreign_key: { to_table: :maker_group_user_infos }

      t.references :select_item_1, foreign_key: { to_table: :lead_column_select_items }
      t.references :select_item_2, foreign_key: { to_table: :lead_column_select_items }
      t.references :select_item_3, foreign_key: { to_table: :lead_column_select_items }
      t.references :select_item_4, foreign_key: { to_table: :lead_column_select_items }
      t.references :select_item_5, foreign_key: { to_table: :lead_column_select_items }
      t.references :select_item_6, foreign_key: { to_table: :lead_column_select_items }
      t.references :select_item_7, foreign_key: { to_table: :lead_column_select_items }
      t.references :select_item_8, foreign_key: { to_table: :lead_column_select_items }
      t.references :select_item_9, foreign_key: { to_table: :lead_column_select_items }
      t.references :select_item_10, foreign_key: { to_table: :lead_column_select_items }
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
      t.float :float_1
      t.float :float_2
      t.float :float_3
      t.float :float_4
      t.float :float_5
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
      t.float :price_1
      t.float :price_2
      t.float :price_3
      t.float :price_4
      t.float :price_5
      t.references :prefecture_1, foreign_key: { to_table: :prefectures }
      t.references :prefecture_2, foreign_key: { to_table: :prefectures }
      t.references :prefecture_3, foreign_key: { to_table: :prefectures }

      t.timestamps
    end
  end
end
