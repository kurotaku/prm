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
#  vendor_group_id  :bigint           not null
#
# Indexes
#
#  index_lead_columns_on_vendor_group_id  (vendor_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (vendor_group_id => vendor_groups.id)
#
class LeadColumn < ApplicationRecord
  before_validation :matching_column
  belongs_to :vendor_group

  has_many :lead_column_select_items

  validates :lead_attribute, presence: true
  validates :order, presence: true
  validates :order, uniqueness: { scope: :vendor_group_id, message: "が既に使われています" }
  validates :index_page_order, allow_nil: true, uniqueness: { scope: :vendor_group_id, message: "が既に使われています" }

  enum data_type: {
    unique_key:        10,
    select_item:       20,
    company:           30,
    staff: 40,
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
    use_data_type = vendor_group.lead_columns.where(data_type: data_type).count
    errors.add(:data_type, "#{data_type_i18n}は上限に達しています（上限：#{lead_attr_count}）") if use_data_type >= lead_attr_count
    self.lead_attribute = data_type
    self.lead_attribute += "_" + (use_data_type + 1).to_s unless %w[unique_key company product].include?(data_type)
    self.lead_attribute += "_id" if %w[select_item company staff product prefecture].include?(data_type)
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
