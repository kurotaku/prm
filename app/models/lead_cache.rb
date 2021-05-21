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
class LeadCache < ApplicationRecord
  belongs_to :lead
  belongs_to :maker_group

  serialize :index_cache, Hash
end
