# == Schema Information
#
# Table name: lead_caches
#
#  id             :bigint           not null, primary key
#  index_cache    :text(65535)
#  show_cache     :text(65535)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  lead_id        :bigint           not null
#  maker_group_id :bigint           not null
#
# Indexes
#
#  index_lead_caches_on_lead_id         (lead_id)
#  index_lead_caches_on_maker_group_id  (maker_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (lead_id => leads.id)
#  fk_rails_...  (maker_group_id => maker_groups.id)
#
require 'rails_helper'

RSpec.describe LeadCache, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
