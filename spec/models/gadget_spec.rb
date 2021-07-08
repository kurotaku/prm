# frozen_string_literal: true

# == Schema Information
#
# Table name: gadgets
#
#  id               :bigint           not null, primary key
#  chart_type       :integer          default("vertical_bar"), not null
#  col_group        :integer
#  name             :string(255)
#  row_group        :integer
#  target_table     :integer          default("lead"), not null
#  uid              :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  dashboard_id     :bigint           not null
#  target_column_id :bigint
#
# Indexes
#
#  index_gadgets_on_dashboard_id      (dashboard_id)
#  index_gadgets_on_target_column_id  (target_column_id)
#
# Foreign Keys
#
#  fk_rails_...  (dashboard_id => dashboards.id)
#  fk_rails_...  (target_column_id => table_columns.id)
#
require "rails_helper"

RSpec.describe Gadget, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
