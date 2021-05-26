# == Schema Information
#
# Table name: lead_columns
#
#  id               :bigint           not null, primary key
#  contract_type    :integer          default(10), not null
#  data_type        :integer          default("select_item"), not null
#  index_page_order :integer
#  key_name         :string(255)
#  lead_attribute   :string(255)
#  name             :string(255)
#  order            :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  product_id       :bigint           not null
#
# Indexes
#
#  index_lead_columns_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#
class LeadColumn < ApplicationRecord
  belongs_to :product
  belongs_to :lead_category, optional: true
  accepts_nested_attributes_for :lead_category

  has_many :lead_column_select_items

  validates :order, presence: true
  validates :order, uniqueness: { scope: :product_id, message: "が既に使われています" }

  enum data_type: {
    select_item:   10,
    partner:   20,
    product:   30,
    date: 40,
    string:  50,
    integer:  60,
    prefecture: 70,
  }
end
