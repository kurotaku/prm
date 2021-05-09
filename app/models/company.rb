# frozen_string_literal: true

# == Schema Information
#
# Table name: companies
#
#  id               :bigint           not null, primary key
#  address          :string(255)
#  address2         :string(255)
#  contract_type    :integer          default("partner"), not null
#  coprate_number   :string(255)
#  deleted_at       :datetime
#  email            :string(255)
#  fax              :string(255)
#  image            :string(255)
#  name             :string(255)
#  name_kana        :string(255)
#  phone            :string(255)
#  postcode         :string(255)
#  settlement_month :integer
#  status           :integer          default(10), not null
#  uid              :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  prefecture_id    :bigint
#
# Indexes
#
#  index_companies_on_prefecture_id  (prefecture_id)
#
# Foreign Keys
#
#  fk_rails_...  (prefecture_id => prefectures.id)
#
class Company < ApplicationRecord
  include Uniqueable

  belongs_to :prefecture, optional: true
  has_many :users
  has_many :user_profiles
  has_many :maker_groups, foreign_key: "maker_id", inverse_of: :maker
  has_many :partners, through: :maker_groups
  has_many :vendor_groups, foreign_key: "vendor_id", inverse_of: :vendor
  has_many :user_action_permissions

  enum contract_type: {
    partner: 10,
    maker:   20,
  }

  mount_uploader :image, ImageUploader

  def maker_group_uid(params)
    return unless vendor_groups.present?

    params[:base_path].present? ? params[:base_path] : vendor_groups.first.maker.uid
  end
end
