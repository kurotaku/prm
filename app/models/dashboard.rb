# frozen_string_literal: true

# == Schema Information
#
# Table name: dashboards
#
#  id              :bigint           not null, primary key
#  name            :string(255)
#  position        :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  vendor_group_id :bigint           not null
#
# Indexes
#
#  index_dashboards_on_vendor_group_id  (vendor_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (vendor_group_id => vendor_groups.id)
#
class Dashboard < ApplicationRecord
  belongs_to :vendor_group
  has_many :gadgets
  has_one :dashboard_layout
end
