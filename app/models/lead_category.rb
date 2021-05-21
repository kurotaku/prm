# == Schema Information
#
# Table name: lead_categories
#
#  id             :bigint           not null, primary key
#  name           :string(255)
#  order          :integer
#  slug           :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  maker_group_id :bigint           not null
#  product_id     :bigint           not null
#
# Indexes
#
#  index_lead_categories_on_maker_group_id  (maker_group_id)
#  index_lead_categories_on_product_id      (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (maker_group_id => maker_groups.id)
#  fk_rails_...  (product_id => products.id)
#
class LeadCategory < ApplicationRecord
  belongs_to :maker_group
  belongs_to :product

  has_many :lead_category_items
end
