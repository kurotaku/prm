# frozen_string_literal: true

# == Schema Information
#
# Table name: lead_column_select_items
#
#  id             :bigint           not null, primary key
#  name           :string(255)
#  order          :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  lead_column_id :bigint           not null
#
# Indexes
#
#  index_lead_column_select_items_on_lead_column_id  (lead_column_id)
#
# Foreign Keys
#
#  fk_rails_...  (lead_column_id => lead_columns.id)
#
class LeadColumnSelectItem < ApplicationRecord
  belongs_to :lead_column
end
