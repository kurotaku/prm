# frozen_string_literal: true

# == Schema Information
#
# Table name: vendor_groups
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  status     :integer          default(10), not null
#  uid        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  vendor_id  :bigint           not null
#
# Indexes
#
#  index_vendor_groups_on_vendor_id  (vendor_id)
#
# Foreign Keys
#
#  fk_rails_...  (vendor_id => companies.id)
#
FactoryBot.define do
  factory :vendor_group do
    maker { nil }
  end
end
