# == Schema Information
#
# Table name: products
#
#  id             :bigint           not null, primary key
#  code           :string(255)
#  deleted_at     :datetime
#  description    :text(65535)
#  incentive      :integer
#  name           :string(255)
#  price          :integer
#  status         :integer          default(10), not null
#  uuid           :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  maker_group_id :bigint           not null
#
# Indexes
#
#  index_products_on_maker_group_id  (maker_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (maker_group_id => maker_groups.id)
#
class Product < ApplicationRecord
  belongs_to :maker_group
  has_many :product_labels
  has_many :product_metas
end
