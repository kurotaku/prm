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
FactoryBot.define do
  factory :table_column_select_item do
    table_column { "MyString" }
    name { "MyString" }
  end
end
