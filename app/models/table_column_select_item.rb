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
class TableColumnSelectItem < ApplicationRecord
  include Uniqueable

  belongs_to :table_column
  has_many :primary_leads, foreign_key: "select_item_1_id", inverse_of: :select_item_1, class_name: "Lead", dependent: :nullify
  has_many :secondary_leads, foreign_key: "select_item_2_id", inverse_of: :select_item_2, class_name: "Lead", dependent: :nullify
  has_many :tertiary_leads, foreign_key: "select_item_3_id", inverse_of: :select_item_3, class_name: "Lead", dependent: :nullify
  has_many :quaternary_leads, foreign_key: "select_item_4_id", inverse_of: :select_item_4, class_name: "Lead", dependent: :nullify
  has_many :quinary_leads, foreign_key: "select_item_5_id", inverse_of: :select_item_5, class_name: "Lead", dependent: :nullify
end
