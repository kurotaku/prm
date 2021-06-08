# == Schema Information
#
# Table name: triggers
#
#  id                      :bigint           not null, primary key
#  trigger_attribute_name  :string(255)
#  trigger_attribute_value :string(255)
#  trigger_type            :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  vendor_group_id         :bigint           not null
#
# Indexes
#
#  index_triggers_on_vendor_group_id  (vendor_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (vendor_group_id => vendor_groups.id)
#
FactoryBot.define do
  factory :trigger do
    vendor_gropup { nil }
    trigger_column { nil }
    trigger_type { 1 }
    trigger_column_value { "MyString" }
    source_model { "MyString" }
    source_column { nil }
    target_model { "MyString" }
    target_column { nil }
  end
end
