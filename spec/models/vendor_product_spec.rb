# == Schema Information
#
# Table name: vendor_products
#
#  id              :bigint           not null, primary key
#  incentive       :integer
#  price           :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  maker_group_id  :bigint           not null
#  product_id      :bigint           not null
#  vendor_group_id :bigint           not null
#
# Indexes
#
#  index_vendor_products_on_maker_group_id   (maker_group_id)
#  index_vendor_products_on_product_id       (product_id)
#  index_vendor_products_on_vendor_group_id  (vendor_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (maker_group_id => maker_groups.id)
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (vendor_group_id => vendor_groups.id)
#
require 'rails_helper'

RSpec.describe VendorProduct, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
