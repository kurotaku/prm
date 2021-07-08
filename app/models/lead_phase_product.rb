# frozen_string_literal: true

# == Schema Information
#
# Table name: lead_phase_products
#
#  id            :bigint           not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  lead_phase_id :bigint           not null
#  product_id    :bigint           not null
#
# Indexes
#
#  index_lead_phase_products_on_lead_phase_id  (lead_phase_id)
#  index_lead_phase_products_on_product_id     (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (lead_phase_id => lead_phases.id)
#  fk_rails_...  (product_id => products.id)
#
class LeadPhaseProduct < ApplicationRecord
  belongs_to :lead_phase
  belongs_to :product
end
