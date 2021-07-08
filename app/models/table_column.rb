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
class TableColumn < ApplicationRecord
  include Uniqueable

  before_validation :matching_column, on: :create

  belongs_to :vendor_group
  belongs_to :target_column, class_name: "TableColumn", optional: true

  has_many :table_column_select_items, dependent: :destroy
  accepts_nested_attributes_for :table_column_select_items, allow_destroy: true

  validates :table_attribute, presence: true
  # validates :position, presence: true
  validates :key_name, presence: true

  acts_as_list

  enum table_type: {
    lead:     10,
    company:  20,
    product:  30,
    contract: 40,
    staff:    50,
    customer: 60,
  }, _prefix: true

  enum target_table: {
    lead:     10,
    company:  20,
    product:  30,
    contract: 40,
    staff:    50,
    customer: 60,
  }, _prefix: true

  # 積み上げ集計の種類
  enum stack_type: {
    count: 10,
    sum:   20,
    min:   30,
    max:   40,
  }, _prefix: true

  # 一桁が標準項目
  # 二桁が関連モデル
  # 100番台がカスタム項目
  # 200番台が特殊なカスタム項目
  enum data_type: {
    undefined:   0,
    created_at:  1,
    updated_at:  2,
    name:        3,
    unique_key:  4,
    price:       5,
    lead_phase:  6,
    lead:        10,
    company:     20,
    product:     30,
    contract:    40,
    staff:       50,
    customer:    60,
    select_item: 100,
    datetime:    110,
    string:      120,
    text:        130,
    integer:     140,
    calc:        200,
    lookup:      210,
    stacked:     220,
  }, _prefix: true

  # rubocop:disable Metrics/AbcSize
  def matching_column
    lead_attr_count = count_table_attr(table_type, data_type)
    use_data_type = vendor_group.table_columns.where(table_type: table_type, data_type: data_type).count
    errors.add(:data_type, "#{data_type_i18n}は上限に達しています（上限：#{lead_attr_count}）") if use_data_type >= lead_attr_count
    self.table_attribute = data_type

    # 1個しか紐づかないもの'以外'は連番を加える
    self.table_attribute += "_" + (use_data_type + 1).to_s unless %w[unique_key name price company product staff lead_phase created_at
                                                                     updated_at].include?(data_type)

    # relationしているものは'_id'を付与
    self.table_attribute += "_id" if %w[select_item company staff lead_phase product prefecture].include?(data_type)
  end
  # rubocop:enable Metrics/AbcSize

  private
    def count_table_attr(table, str)
      case table
      when "lead"
        column_names = Lead.column_names
      when "product"
        column_names = Product.column_names
      when "company"
        column_names = Company.column_names
      when "contract"
        column_names = Contract.column_names
      when "staff"
        column_names = Staff.column_names
      end
      attrs = column_names.select do |x|
        x.start_with?(str)
      end
      raise ArgumentError, "\u30C7\u30FC\u30BF\u30BF\u30A4\u30D7\u306E\u6307\u5B9A\u306B\u554F\u984C\u304C\u3042\u308A\u307E\u3059\u3002" if attrs.count == 0

      attrs.count
    end
end
