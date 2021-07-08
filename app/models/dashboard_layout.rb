# frozen_string_literal: true

# == Schema Information
#
# Table name: dashboard_layouts
#
#  id           :bigint           not null, primary key
#  layout       :json
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  dashboard_id :bigint           not null
#
# Indexes
#
#  index_dashboard_layouts_on_dashboard_id  (dashboard_id)
#
# Foreign Keys
#
#  fk_rails_...  (dashboard_id => dashboards.id)
#
class DashboardLayout < ApplicationRecord
  belongs_to :dashboard
end
