# frozen_string_literal: true

# == Schema Information
#
# Table name: agents
#
#  id              :bigint           not null, primary key
#  deleted_at      :datetime
#  hierarchy       :integer
#  status          :integer          default(10), not null
#  uid             :string(255)
#  vendor_memo     :text(65535)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  company_id      :bigint           not null
#  maker_group_id  :bigint           not null
#  parent_id       :bigint
#  vendor_group_id :bigint           not null
#
# Indexes
#
#  index_agents_on_company_id       (company_id)
#  index_agents_on_maker_group_id   (maker_group_id)
#  index_agents_on_parent_id        (parent_id)
#  index_agents_on_vendor_group_id  (vendor_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (maker_group_id => maker_groups.id)
#  fk_rails_...  (parent_id => companies.id)
#  fk_rails_...  (vendor_group_id => vendor_groups.id)
#
require "rails_helper"

RSpec.describe Agent, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
