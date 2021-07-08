# frozen_string_literal: true

# == Schema Information
#
# Table name: vendor_groups
#
#  id                     :bigint           not null, primary key
#  deleted_at             :datetime
#  name                   :string(255)
#  uid                    :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  vendor_organization_id :bigint           not null
#
# Indexes
#
#  index_vendor_groups_on_vendor_organization_id  (vendor_organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (vendor_organization_id => organizations.id)
#
class VendorGroup < ApplicationRecord
  include Uniqueable

  belongs_to :vendor_organization, class_name: "Organization"
  has_many :companies
  has_many :staffs
  has_many :products
  has_many :table_columns
  has_many :contracts
  has_many :triggers
  has_many :lead_phases
  has_many :leads
  has_many :shared_files
  has_many :boards
  has_many :csv_import_histories
  has_many :dashboards

  after_create :create_default_column

  def partners
    companies.where(partnership_type: "partner")
  end

  def uncontracted_partners
    partners.left_joins(:contracts).where(contracts: { id: nil })
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def create_default_column
    # lead
    table_columns.create!(default_column: true, table_type: "lead", index_page_position: 1, name: "ユニークキー", key_name: "unique_key", data_type: :unique_key)
    table_columns.create!(default_column: true, table_type: "lead", index_page_position: 2, name: "商談名", key_name: "name", data_type: :name)
    table_columns.create!(default_column: true, table_type: "lead", index_page_position: 3, name: "パートナー名", key_name: "partner", data_type: :company)
    table_columns.create!(default_column: true, table_type: "lead", index_page_position: 4, name: "営業担当", key_name: "staff", data_type: :staff)
    table_columns.create!(default_column: true, table_type: "lead", index_page_position: 5, name: "商品", key_name: "product", data_type: :product)
    table_columns.create!(default_column: true, table_type: "lead", index_page_position: 6, name: "商談フェイズ", key_name: "phase", data_type: :lead_phase)
    table_columns.create!(default_column: true, table_type: "lead", index_page_position: 7, name: "作成日", key_name: "created_at", data_type: :created_at)
    table_columns.create!(default_column: true, table_type: "lead", index_page_position: 8, name: "最終更新日", key_name: "updated_at", data_type: :updated_at)

    # product
    table_columns.create!(default_column: true, table_type: "product", index_page_position: 1, name: "ユニークキー", key_name: "unique_key", data_type: :unique_key)
    table_columns.create!(default_column: true, table_type: "product", index_page_position: 2, name: "商品名", key_name: "name", data_type: :name)
    table_columns.create!(default_column: true, table_type: "product", index_page_position: 3, name: "価格", key_name: "price", data_type: :price)
    table_columns.create!(default_column: true, table_type: "product", index_page_position: 4, name: "作成日", key_name: "created_at", data_type: :created_at)
    table_columns.create!(default_column: true, table_type: "product", index_page_position: 5, name: "最終更新日", key_name: "updated_at", data_type: :updated_at)

    # company
    table_columns.create!(default_column: true, table_type: "company", index_page_position: 1, name: "パートナー名", key_name: "name", data_type: :name)
    table_columns.create!(default_column: true, table_type: "company", index_page_position: 2, name: "作成日", key_name: "created_at", data_type: :created_at)
    table_columns.create!(default_column: true, table_type: "company", index_page_position: 3, name: "最終更新日", key_name: "updated_at", data_type: :updated_at)

    # staff
    table_columns.create!(default_column: true, table_type: "staff", index_page_position: 1, name: "担当者名", key_name: "name", data_type: :name)
    table_columns.create!(default_column: true, table_type: "staff", index_page_position: 2, name: "企業名", key_name: "partner", data_type: :company)
    table_columns.create!(default_column: true, table_type: "staff", index_page_position: 3, name: "作成日", key_name: "created_at", data_type: :created_at)
    table_columns.create!(default_column: true, table_type: "staff", index_page_position: 4, name: "最終更新日", key_name: "updated_at", data_type: :updated_at)

    # contract
    table_columns.create!(default_column: true, table_type: "contract", index_page_position: 1, name: "ユニークキー", key_name: "unique_key", data_type: :unique_key)
    table_columns.create!(default_column: true, table_type: "contract", index_page_position: 2, name: "契約名", key_name: "name", data_type: :name)
    table_columns.create!(default_column: true, table_type: "contract", index_page_position: 3, name: "パートナー名", key_name: "partner", data_type: :company)
    table_columns.create!(default_column: true, table_type: "contract", index_page_position: 4, name: "商品", key_name: "product", data_type: :product)
    table_columns.create!(default_column: true, table_type: "contract", index_page_position: 5, name: "価格", key_name: "price", data_type: :price)
    table_columns.create!(default_column: true, table_type: "contract", index_page_position: 6, name: "作成日", key_name: "created_at", data_type: :created_at)
    table_columns.create!(default_column: true, table_type: "contract", index_page_position: 7, name: "最終更新日", key_name: "updated_at", data_type: :updated_at)
    table_columns.create!(default_column: false, table_type: "contract", index_page_position: 8, name: "契約開始日", key_name: "contracted_at", data_type: :datetime)
    table_columns.create!(default_column: false, table_type: "contract", index_page_position: 9, name: "契約終了日", key_name: "contract_end_at",
data_type: :datetime)
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength
end
