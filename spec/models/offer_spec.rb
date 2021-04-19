# == Schema Information
#
# Table name: offers
#
#  id              :bigint           not null, primary key
#  confirmed_at    :datetime
#  progress        :integer
#  saled_at        :datetime
#  type            :integer
#  unique_key      :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  agent_id        :bigint           not null
#  maker_group_id  :bigint           not null
#  product_id      :bigint           not null
#  user_id         :bigint
#  vendor_group_id :bigint           not null
#
# Indexes
#
#  index_offers_on_agent_id         (agent_id)
#  index_offers_on_maker_group_id   (maker_group_id)
#  index_offers_on_product_id       (product_id)
#  index_offers_on_user_id          (user_id)
#  index_offers_on_vendor_group_id  (vendor_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (agent_id => agents.id)
#  fk_rails_...  (maker_group_id => maker_groups.id)
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (vendor_group_id => vendor_groups.id)
#
require 'rails_helper'

RSpec.describe Offer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
