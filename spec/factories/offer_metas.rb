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
FactoryBot.define do
  factory :offer_meta do
    offer { nil }
    meta_kay { 'MyString' }
    meta_value { 'MyString' }
    order { 1 }
  end
end
