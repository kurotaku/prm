# frozen_string_literal: true

# == Schema Information
#
# Table name: table_column_select_items
#
#  id              :bigint           not null, primary key
#  name            :string(255)
#  position        :integer
#  uid             :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  table_column_id :bigint           not null
#
# Indexes
#
#  index_table_column_select_items_on_table_column_id  (table_column_id)
#
# Foreign Keys
#
#  fk_rails_...  (table_column_id => table_columns.id)
#
require "rails_helper"

RSpec.describe TableColumnSelectItem, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
