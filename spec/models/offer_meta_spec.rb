# frozen_string_literal: true

# == Schema Information
#
# Table name: offer_metas
#
#  id         :bigint           not null, primary key
#  meta_key   :string(255)
#  meta_label :string(255)
#  meta_value :string(255)
#  order      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  offer_id   :bigint           not null
#
# Indexes
#
#  index_offer_metas_on_offer_id  (offer_id)
#
# Foreign Keys
#
#  fk_rails_...  (offer_id => offers.id)
#
require "rails_helper"

RSpec.describe OfferMeta, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
