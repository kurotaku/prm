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
require 'rails_helper'

RSpec.describe Trigger, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
