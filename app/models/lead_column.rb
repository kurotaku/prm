# == Schema Information
#
# Table name: lead_columns
#
#  id               :bigint           not null, primary key
#  contract_type    :integer          default(10), not null
#  data_type        :integer          default("category"), not null
#  key_name         :string(255)
#  lead_column      :string(255)
#  name             :string(255)
#  order            :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  lead_category_id :bigint
#  product_id       :bigint           not null
#
# Indexes
#
#  index_lead_columns_on_lead_category_id  (lead_category_id)
#  index_lead_columns_on_product_id        (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (lead_category_id => lead_categories.id)
#  fk_rails_...  (product_id => products.id)
#
class LeadColumn < ApplicationRecord
  belongs_to :product
  belongs_to :lead_category, optional: true

  validates :order, presence: true
  validates :order, uniqueness: { scope: :product_id, message: "が既に使われています" }

  enum data_type: {
    category:   10,
    partner:   20,
    product:   30,
    date: 40,
    string:  50,
    integer:  60,
    prefecture: 70,
  }
end
