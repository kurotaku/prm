# frozen_string_literal: true

# == Schema Information
#
# Table name: vendor_groups
#
#  id                     :bigint           not null, primary key
#  deleted_at             :datetime
#  name                   :string(255)
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
FactoryBot.define do
  factory :vendor_group do
    vendor_organization { nil }
  end
end
