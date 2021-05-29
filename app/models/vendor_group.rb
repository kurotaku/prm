# frozen_string_literal: true

# == Schema Information
#
# Table name: vendor_groups
#
#  id               :bigint           not null, primary key
#  contract_type    :integer          default("agency"), not null
#  contracted_at    :date
#  deleted_at       :datetime
#  description      :text(65535)
#  incentive        :integer
#  layer            :integer
#  maker_memo       :text(65535)
#  price            :integer
#  product_name     :string(255)
#  settlement_month :integer
#  status           :integer          default(10), not null
#  uid              :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  maker_group_id   :bigint           not null
#  product_id       :bigint           not null
#  vendor_id        :bigint           not null
#
# Indexes
#
#  index_vendor_groups_on_maker_group_id  (maker_group_id)
#  index_vendor_groups_on_product_id      (product_id)
#  index_vendor_groups_on_vendor_id       (vendor_id)
#
# Foreign Keys
#
#  fk_rails_...  (maker_group_id => maker_groups.id)
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (vendor_id => partners.id)
#
class VendorGroup < ApplicationRecord
  include Uniqueable

  belongs_to :maker_group
  belongs_to :vendor, class_name: "Partner"
  belongs_to :product, optional: true

  enum contract_type: {
    agency:       10,
    introduction: 20,
    wholesale:    30,
  }

  enum layer: {
    layer_one:   1,
    layer_two:   2,
    layer_three: 3,
    layer_four:  4,
    layer_five:  5,
  }
end
