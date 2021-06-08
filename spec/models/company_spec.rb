# == Schema Information
#
# Table name: companies
#
#  id              :bigint           not null, primary key
#  address         :string(255)
#  address2        :string(255)
#  contract_type   :integer          default("partner"), not null
#  deleted_at      :datetime
#  hierarchy       :integer          default("hierarchy_one")
#  name            :string(255)
#  phone           :string(255)
#  status          :integer          default(10), not null
#  uid             :string(255)
#  vendor_memo     :text(65535)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint
#  parent_id       :bigint
#  vendor_group_id :bigint           not null
#
# Indexes
#
#  index_companies_on_organization_id  (organization_id)
#  index_companies_on_parent_id        (parent_id)
#  index_companies_on_vendor_group_id  (vendor_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (parent_id => companies.id)
#  fk_rails_...  (vendor_group_id => vendor_groups.id)
#
require 'rails_helper'

RSpec.describe Company, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
