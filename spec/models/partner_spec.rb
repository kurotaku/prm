# frozen_string_literal: true

# == Schema Information
#
# Table name: partners
#
#  id              :bigint           not null, primary key
#  address         :string(255)
#  deleted_at      :datetime
#  hierarchy       :integer          default("hierarchy_one")
#  name            :string(255)
#  status          :integer          default(10), not null
#  uid             :string(255)
#  vendor_memo     :text(65535)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  company_id      :bigint
#  parent_id       :bigint
#  vendor_group_id :bigint           not null
#
# Indexes
#
#  index_partners_on_company_id       (company_id)
#  index_partners_on_parent_id        (parent_id)
#  index_partners_on_vendor_group_id  (vendor_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (parent_id => partners.id)
#  fk_rails_...  (vendor_group_id => vendor_groups.id)
#
require "rails_helper"

RSpec.describe Partner, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
