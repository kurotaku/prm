# frozen_string_literal: true

# == Schema Information
#
# Table name: lead_columns
#
#  id               :bigint           not null, primary key
#  contract_type    :integer          default(10), not null
#  data_type        :integer          default("unique_key"), not null
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
  before_validation :matching_column
  belongs_to :product
  belongs_to :lead_category, optional: true
  accepts_nested_attributes_for :lead_category

  has_many :lead_column_select_items

  validates :lead_attribute, presence: true
  validates :order, presence: true
  validates :order, uniqueness: { scope: :product_id, message: "が既に使われています" }
  validates :index_page_order, allow_nil: true, uniqueness: { scope: :product_id, message: "が既に使われています" }

  enum data_type: {
    unique_key:        10,
    select_item:       20,
    partner:           30,
    user_info_partner: 40,
    product:           50,
    prefecture:        60,
    datetime:          70,
    string:            80,
    text:              90,
    integer:           100,
    float:             110,
    price:             120,
  }

  def matching_column
    lead_attr_count = count_lead_attr(data_type)
    use_data_type = product.lead_columns.where(data_type: data_type).count
    errors.add(:data_type, "#{data_type_i18n}は上限に達しています（上限：#{lead_attr_count}）") if use_data_type >= lead_attr_count
    self.lead_attribute = data_type
    self.lead_attribute += "_" + (use_data_type + 1).to_s unless %w[unique_key partner product].include?(data_type)
    self.lead_attribute += "_id" if %w[select_item partner user_info_partner product prefecture].include?(data_type)
  end

  private
    def count_lead_attr(str)
      attrs = Lead.column_names.select do |x|
        x.start_with?(str)
      end
      raise ArgumentError, "データタイプの指定に問題があります。" if attrs.count == 0
      attrs.count
    end
end
