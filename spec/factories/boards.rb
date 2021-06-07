# frozen_string_literal: true

# == Schema Information
#
# Table name: boards
#
#  id                 :bigint           not null, primary key
#  related_object     :string(255)
#  related_object_uid :string(255)
#  status             :integer          default(10), not null
#  uid                :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  vendor_group_id    :bigint           not null
#
# Indexes
#
#  index_boards_on_vendor_group_id  (vendor_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (vendor_group_id => vendor_groups.id)
#
FactoryBot.define do
  factory :board do
    related_object { "MyString" }
    related_object { "MyString" }
    related_object_id { 1 }
  end
end
