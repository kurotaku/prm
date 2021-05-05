# == Schema Information
#
# Table name: maker_groups
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  status     :integer          default(10), not null
#  uid        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  maker_id   :bigint           not null
#
# Indexes
#
#  index_maker_groups_on_maker_id  (maker_id)
#
# Foreign Keys
#
#  fk_rails_...  (maker_id => companies.id)
#
class MakerGroup < ApplicationRecord
  include Uniqueable
  
  belongs_to :maker, class_name: 'Company'
  has_many :partners
  has_many :products
  has_many :vendor_groups
  has_many :vendor_products
  has_many :agent_products
  has_many :offers
  has_many :maker_informations
end
