# frozen_string_literal: true

# == Schema Information
#
# Table name: vendor_group_user_infos
#
#  id              :bigint           not null, primary key
#  deleted_at      :datetime
#  email           :string(255)
#  name            :string(255)
#  phone           :string(255)
#  status          :integer          default(10), not null
#  uid             :string(255)
#  unique_key      :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  company_id      :bigint
#  partner_id      :bigint
#  user_id         :bigint
#  vendor_group_id :bigint           not null
#
# Indexes
#
#  index_vendor_group_user_infos_on_company_id       (company_id)
#  index_vendor_group_user_infos_on_partner_id       (partner_id)
#  index_vendor_group_user_infos_on_user_id          (user_id)
#  index_vendor_group_user_infos_on_vendor_group_id  (vendor_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (partner_id => partners.id)
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (vendor_group_id => vendor_groups.id)
#
require "rails_helper"

RSpec.describe VendorGroupUserInfo, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
