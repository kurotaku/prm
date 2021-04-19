# == Schema Information
#
# Table name: companies
#
#  id               :bigint           not null, primary key
#  address          :string(255)
#  address2         :string(255)
#  coprate_number   :string(255)
#  deleted_at       :datetime
#  email            :string(255)
#  fax              :string(255)
#  image            :text(65535)
#  name             :string(255)
#  name_kana        :string(255)
#  phone            :string(255)
#  postcode         :string(255)
#  settlement_month :integer
#  status           :integer          default(10), not null
#  uuid             :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  prefecture_id    :bigint           not null
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
  belongs_to :prefecture
  has_many :users
  has_many :maker_groups, foreign_key: 'maker_id', inverse_of: :maker
  has_many :partners, through: :maker_groups

  has_many :vendor_groups, foreign_key: 'vendor_id', inverse_of: :vendor
end
