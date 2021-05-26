# == Schema Information
#
# Table name: leads
#
#  id                :bigint           not null, primary key
#  contract_type     :integer          default(10), not null
#  datetime_1        :datetime
#  datetime_2        :datetime
#  datetime_3        :datetime
#  datetime_4        :datetime
#  datetime_5        :datetime
#  index_cache       :text(65535)
#  integer_1         :integer
#  integer_2         :integer
#  integer_3         :integer
#  integer_4         :integer
#  integer_5         :integer
#  progress          :integer
#  show_cache        :text(65535)
#  string_1          :string(255)
#  string_2          :string(255)
#  string_3          :string(255)
#  string_4          :string(255)
#  string_5          :string(255)
#  text_1            :text(65535)
#  text_2            :text(65535)
#  text_3            :text(65535)
#  text_4            :text(65535)
#  text_5            :text(65535)
#  unique_key        :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  maker_group_id    :bigint           not null
#  partner_id        :bigint
#  prefecture_1_id   :bigint
#  prefecture_2_id   :bigint
#  prefecture_3_id   :bigint
#  product_id        :bigint
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
#
# Indexes
#
#  index_leads_on_maker_group_id     (maker_group_id)
#  index_leads_on_partner_id         (partner_id)
#  index_leads_on_prefecture_1_id    (prefecture_1_id)
#  index_leads_on_prefecture_2_id    (prefecture_2_id)
#  index_leads_on_prefecture_3_id    (prefecture_3_id)
#  index_leads_on_product_id         (product_id)
#  index_leads_on_progress           (progress)
#  index_leads_on_select_item_10_id  (select_item_10_id)
#  index_leads_on_select_item_1_id   (select_item_1_id)
#  index_leads_on_select_item_2_id   (select_item_2_id)
#  index_leads_on_select_item_3_id   (select_item_3_id)
#  index_leads_on_select_item_4_id   (select_item_4_id)
#  index_leads_on_select_item_5_id   (select_item_5_id)
#  index_leads_on_select_item_6_id   (select_item_6_id)
#  index_leads_on_select_item_7_id   (select_item_7_id)
#  index_leads_on_select_item_8_id   (select_item_8_id)
#  index_leads_on_select_item_9_id   (select_item_9_id)
#
# Foreign Keys
#
#  fk_rails_...  (maker_group_id => maker_groups.id)
#  fk_rails_...  (partner_id => partners.id)
#  fk_rails_...  (prefecture_1_id => prefectures.id)
#  fk_rails_...  (prefecture_2_id => prefectures.id)
#  fk_rails_...  (prefecture_3_id => prefectures.id)
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (select_item_10_id => lead_column_select_items.id)
#  fk_rails_...  (select_item_1_id => lead_column_select_items.id)
#  fk_rails_...  (select_item_2_id => lead_column_select_items.id)
#  fk_rails_...  (select_item_3_id => lead_column_select_items.id)
#  fk_rails_...  (select_item_4_id => lead_column_select_items.id)
#  fk_rails_...  (select_item_5_id => lead_column_select_items.id)
#  fk_rails_...  (select_item_6_id => lead_column_select_items.id)
#  fk_rails_...  (select_item_7_id => lead_column_select_items.id)
#  fk_rails_...  (select_item_8_id => lead_column_select_items.id)
#  fk_rails_...  (select_item_9_id => lead_column_select_items.id)
#
require 'rails_helper'

RSpec.describe Lead, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
