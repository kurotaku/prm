# == Schema Information
#
# Table name: lead_index_columns
#
#  id               :bigint           not null, primary key
#  contract_type    :integer          default(10), not null
#  data_type        :integer          default("category"), not null
#  lead_column      :string(255)
#  name             :string(255)
#  order            :integer          default(1), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  lead_category_id :bigint
#  product_id       :bigint           not null
#
# Indexes
#
#  index_lead_index_columns_on_lead_category_id  (lead_category_id)
#  index_lead_index_columns_on_product_id        (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (lead_category_id => lead_categories.id)
#  fk_rails_...  (product_id => products.id)
#
FactoryBot.define do
  factory :lead_index_column do
    
  end
end
