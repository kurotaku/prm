# frozen_string_literal: true

# == Schema Information
#
# Table name: lead_phases
#
#  id              :bigint           not null, primary key
#  name            :string(255)
#  phase_role      :integer
#  position        :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  vendor_group_id :bigint           not null
#
# Indexes
#
#  index_lead_phases_on_vendor_group_id  (vendor_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (vendor_group_id => vendor_groups.id)
#
FactoryBot.define do
  factory :lead_phase do
    vendor_group { nil }
    name { "MyString" }
    position { 1 }
    phase_role { 1 }
  end
end
