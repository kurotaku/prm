# == Schema Information
#
# Table name: lead_category_items
#
#  id               :bigint           not null, primary key
#  name             :string(255)
#  order            :integer
#  slug             :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  lead_category_id :bigint           not null
#
# Indexes
#
#  index_lead_category_items_on_lead_category_id  (lead_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (lead_category_id => lead_categories.id)
#
class LeadCategoryItem < ApplicationRecord
  belongs_to :lead_category
end