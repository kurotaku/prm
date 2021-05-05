# == Schema Information
#
# Table name: offers
#
#  id              :bigint           not null, primary key
#  confirmed_at    :datetime
#  progress        :integer
#  saled_at        :datetime
#  status          :integer          default(10), not null
#  type            :integer
#  uid             :string(255)
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
FactoryBot.define do
  factory :offer do
    maker_group { nil }
    vendor_group { nil }
    product { nil }
    user {nil}
    saled_at { "MyString" }
    progress { 1 }
    unique_key { "MyString" }
  end
end
