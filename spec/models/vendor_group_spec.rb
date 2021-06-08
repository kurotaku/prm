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
require "rails_helper"

RSpec.describe VendorGroup, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
