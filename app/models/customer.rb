# frozen_string_literal: true

# == Schema Information
#
# Table name: customers
#
#  id                :bigint           not null, primary key
#  datetime_1        :datetime
#  datetime_2        :datetime
#  datetime_3        :datetime
#  datetime_4        :datetime
#  datetime_5        :datetime
#  deleted_at        :datetime
#  float_1           :float(24)
#  float_2           :float(24)
#  float_3           :float(24)
#  float_4           :float(24)
#  float_5           :float(24)
#  index_cache       :text(65535)
#  integer_1         :integer
#  integer_2         :integer
#  integer_3         :integer
#  integer_4         :integer
#  integer_5         :integer
#  name              :string(255)
#  show_cache        :text(65535)
#  string_1          :string(255)
#  string_2          :string(255)
#  string_3          :string(255)
#  string_4          :string(255)
#  string_5          :string(255)
#  string_6          :string(255)
#  string_7          :string(255)
#  string_8          :string(255)
#  string_9          :string(255)
#  text_1            :text(65535)
#  text_2            :text(65535)
#  text_3            :text(65535)
#  text_4            :text(65535)
#  text_5            :text(65535)
#  uid               :string(255)
#  unique_key        :string(255)
#  vendor_memo       :text(65535)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  lead_id           :bigint
#  select_item_10_id :bigint
#  select_item_1_id  :bigint
#  select_item_2_id  :bigint
#  select_item_3_id  :bigint
#  select_item_4_id  :bigint
#  select_item_5_id  :bigint
#  select_item_6_id  :bigint
#  select_item_7_id  :bigint
#  select_item_8_id  :bigint
#  select_item_9_id  :bigint
#  vendor_group_id   :bigint
#
# Indexes
#
#  index_customers_on_lead_id            (lead_id)
#  index_customers_on_select_item_10_id  (select_item_10_id)
#  index_customers_on_select_item_1_id   (select_item_1_id)
#  index_customers_on_select_item_2_id   (select_item_2_id)
#  index_customers_on_select_item_3_id   (select_item_3_id)
#  index_customers_on_select_item_4_id   (select_item_4_id)
#  index_customers_on_select_item_5_id   (select_item_5_id)
#  index_customers_on_select_item_6_id   (select_item_6_id)
#  index_customers_on_select_item_7_id   (select_item_7_id)
#  index_customers_on_select_item_8_id   (select_item_8_id)
#  index_customers_on_select_item_9_id   (select_item_9_id)
#  index_customers_on_vendor_group_id    (vendor_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (lead_id => leads.id)
#  fk_rails_...  (select_item_10_id => table_column_select_items.id)
#  fk_rails_...  (select_item_1_id => table_column_select_items.id)
#  fk_rails_...  (select_item_2_id => table_column_select_items.id)
#  fk_rails_...  (select_item_3_id => table_column_select_items.id)
#  fk_rails_...  (select_item_4_id => table_column_select_items.id)
#  fk_rails_...  (select_item_5_id => table_column_select_items.id)
#  fk_rails_...  (select_item_6_id => table_column_select_items.id)
#  fk_rails_...  (select_item_7_id => table_column_select_items.id)
#  fk_rails_...  (select_item_8_id => table_column_select_items.id)
#  fk_rails_...  (select_item_9_id => table_column_select_items.id)
#
class Customer < ApplicationRecord
  include Uniqueable

  belongs_to :vendor_group
end
