# frozen_string_literal: true

# == Schema Information
#
# Table name: vendor_groups
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  status     :integer          default(10), not null
#  uid        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  vendor_id  :bigint           not null
#
# Indexes
#
#  index_vendor_groups_on_vendor_id  (vendor_id)
#
# Foreign Keys
#
#  fk_rails_...  (vendor_id => companies.id)
#
class VendorGroup < ApplicationRecord
  include Uniqueable

  belongs_to :vendor, class_name: "Company"
  has_many :partners
  has_many :vendor_group_user_infos
  has_many :products
  has_many :lead_columns
  has_many :leads
  has_many :shared_files
end
