# frozen_string_literal: true

# == Schema Information
#
# Table name: vendor_informations
#
#  id              :bigint           not null, primary key
#  content         :text(65535)
#  status          :integer          default(10), not null
#  title           :string(255)
#  uid             :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  maker_group_id  :bigint           not null
#  user_id         :bigint           not null
#  vendor_group_id :bigint           not null
#
# Indexes
#
#  index_vendor_informations_on_maker_group_id   (maker_group_id)
#  index_vendor_informations_on_user_id          (user_id)
#  index_vendor_informations_on_vendor_group_id  (vendor_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (maker_group_id => maker_groups.id)
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (vendor_group_id => vendor_groups.id)
#
FactoryBot.define do
  factory :vendor_information do
    maker_group { nil }
    vendor_group { nil }
    title { "MyString" }
    content { "MyText" }
    user { nil }
  end
end
