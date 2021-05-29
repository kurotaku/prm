# frozen_string_literal: true

# == Schema Information
#
# Table name: lead_columns
#
#  id               :bigint           not null, primary key
#  contract_type    :integer          default(10), not null
#  data_type        :integer          default("select_item"), not null
#  index_page_order :integer
#  key_name         :string(255)
#  lead_attribute   :string(255)
#  name             :string(255)
#  order            :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  product_id       :bigint           not null
#
# Indexes
#
#  index_lead_columns_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#
require "rails_helper"

RSpec.describe LeadColumn, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
