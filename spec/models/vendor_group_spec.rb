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
require "rails_helper"

RSpec.describe VendorGroup, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
