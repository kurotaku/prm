# frozen_string_literal: true

# == Schema Information
#
# Table name: organizations
#
#  id               :bigint           not null, primary key
#  address          :string(255)
#  address2         :string(255)
#  coprate_number   :string(255)
#  deleted_at       :datetime
#  email            :string(255)
#  image            :string(255)
#  name             :string(255)
#  name_kana        :string(255)
#  partnership_type :integer          default("partner"), not null
#  phone            :string(255)
#  postcode         :string(255)
#  uid              :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Organization < ApplicationRecord
  include Uniqueable

  has_many :users
  has_many :staffs
  has_many :partners, through: :vendor_groups
  has_many :vendor_groups, foreign_key: "vendor_organization_id", inverse_of: :vendor_organization
  has_many :user_action_permissions

  enum partnership_type: {
    partner: 10,
    vendor:  20,
  }

  mount_uploader :image, ImageUploader

  def vendor_group_uid(params)
    return unless vendor_groups.present?

    params[:base_path].present? ? params[:base_path] : vendor_groups.first.maker.uid
  end
end
