# frozen_string_literal: true

class CreateContracts < ActiveRecord::Migration[6.1]
  def change
    create_table :contracts do |t|
      t.references :vendor_group, null: false, foreign_key: true

      t.integer :sales_amount, default: 0, null: false
      t.integer :sales_price_amount, default: 0, null: false

      t.string :uid
      t.datetime :deleted_at

      ############## TABLE COLUMN ##############
      t.string :name
      t.string :unique_key
      t.integer :price, default: 0, null: false

      t.references :select_item_1, foreign_key: { to_table: :table_column_select_items }
      t.references :select_item_2, foreign_key: { to_table: :table_column_select_items }
      t.references :select_item_3, foreign_key: { to_table: :table_column_select_items }
      t.references :select_item_4, foreign_key: { to_table: :table_column_select_items }
      t.references :select_item_5, foreign_key: { to_table: :table_column_select_items }
      t.references :select_item_6, foreign_key: { to_table: :table_column_select_items }
      t.references :select_item_7, foreign_key: { to_table: :table_column_select_items }
      t.references :select_item_8, foreign_key: { to_table: :table_column_select_items }
      t.references :select_item_9, foreign_key: { to_table: :table_column_select_items }
      t.references :select_item_10, foreign_key: { to_table: :table_column_select_items }

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
      t.string :string_6
      t.string :string_7
      t.string :string_8
      t.string :string_9
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
      t.float :float_1
      t.float :float_2
      t.float :float_3
      t.float :float_4
      t.float :float_5

      t.string :calc_1
      t.string :calc_2
      t.string :calc_3
      t.string :calc_4
      t.string :calc_5
      t.string :lookup_1
      t.string :lookup_2
      t.string :lookup_3
      t.string :lookup_4
      t.string :lookup_5
      t.string :stacked_1
      t.string :stacked_2
      t.string :stacked_3
      t.string :stacked_4
      t.string :stacked_5

      t.text :vendor_memo
      t.text :index_cache
      t.text :show_cache
      ############################################

      t.timestamps
    end
  end
end
