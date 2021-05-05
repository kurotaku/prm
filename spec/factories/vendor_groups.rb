# == Schema Information
#
# Table name: vendor_groups
#
#  id             :bigint           not null, primary key
#  deleted_at     :datetime
#  layer          :integer
#  status         :integer          default(10), not null
#  uid            :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  maker_group_id :bigint           not null
#  vendor_id      :bigint           not null
#
# Indexes
#
#  index_vendor_groups_on_maker_group_id  (maker_group_id)
#  index_vendor_groups_on_vendor_id       (vendor_id)
#
# Foreign Keys
#
#  fk_rails_...  (maker_group_id => maker_groups.id)
#  fk_rails_...  (vendor_id => companies.id)
#
FactoryBot.define do
  factory :vendor_group do
    maker_group { nil }
    vendor { nil }
    layer { 1 }
    uuid { "MyString" }
  end
end
