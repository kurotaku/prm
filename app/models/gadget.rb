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
class Gadget < ApplicationRecord
  include Uniqueable

  belongs_to :dashboard
  belongs_to :target_column, class_name: "TableColumn", optional: true

  enum target_table: {
    lead:     10,
    company:  20,
    product:  30,
    contract: 40,
    staff:    50,
    customer: 60,
  }, _prefix: true

  enum row_group: {
    lead:     10,
    company:  20,
    product:  30,
    contract: 40,
    staff:    50,
    customer: 60,
  }, _prefix: true

  enum col_group: {
    lead:     10,
    company:  20,
    product:  30,
    contract: 40,
    staff:    50,
    customer: 60,
  }, _prefix: true

  enum chart_type: {
    vertical_bar: 10,
    stacked_bar:  11,
  }
end
