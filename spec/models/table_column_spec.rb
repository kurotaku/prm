# frozen_string_literal: true

# == Schema Information
#
# Table name: table_columns
#
#  id                  :bigint           not null, primary key
#  data_type           :integer          default("undefined"), not null
#  default_column      :boolean          default(FALSE)
#  index_page_position :integer
#  key_name            :string(255)
#  name                :string(255)
#  position            :integer          not null
#  stack_type          :integer
#  table_attribute     :string(255)
#  table_type          :integer          default("lead"), not null
#  target_table        :integer
#  uid                 :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  target_column_id    :bigint
#  vendor_group_id     :bigint           not null
#
# Indexes
#
#  index_table_columns_on_target_column_id  (target_column_id)
#  index_table_columns_on_vendor_group_id   (vendor_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (target_column_id => table_columns.id)
#  fk_rails_...  (vendor_group_id => vendor_groups.id)
#
require "rails_helper"

RSpec.describe TableColumn, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
