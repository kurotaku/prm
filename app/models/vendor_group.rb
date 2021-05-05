# == Schema Information
#
# Table name: vendor_groups
#
#  id             :bigint           not null, primary key
#  deleted_at     :datetime
#  layer          :integer
#  status         :integer          default(10), not null
#  uid            :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  maker_group_id :bigint           not null
#  vendor_id      :bigint           not null
#
# Indexes
#
#  index_vendor_groups_on_maker_group_id  (maker_group_id)
#  index_vendor_groups_on_vendor_id       (vendor_id)
#
# Foreign Keys
#
#  fk_rails_...  (maker_group_id => maker_groups.id)
#  fk_rails_...  (vendor_id => companies.id)
#
class VendorGroup < ApplicationRecord
  include Uniqueable
  
  belongs_to :maker_group
  belongs_to :vendor, class_name: 'Company'
  has_many :agents
  has_many :agent_products
  has_many :vendor_informations
  has_many :offers
end
