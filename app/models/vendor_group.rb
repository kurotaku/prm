# frozen_string_literal: true

# == Schema Information
#
# Table name: vendor_groups
#
#  id                     :bigint           not null, primary key
#  deleted_at             :datetime
#  name                   :string(255)
#  status                 :integer          default(10), not null
#  uid                    :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  vendor_organization_id :bigint           not null
#
# Indexes
#
#  index_vendor_groups_on_vendor_organization_id  (vendor_organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (vendor_organization_id => organizations.id)
#
class VendorGroup < ApplicationRecord
  include Uniqueable

  belongs_to :vendor_organization, class_name: "Organization"
  has_many :companies
  has_many :staffs
  has_many :products
  has_many :lead_columns
  has_many :leads
  has_many :shared_files
  has_many :boards

  def partners
    companies.where(contract_type: 'partner')
  end
end
