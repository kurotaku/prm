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
FactoryBot.define do
  factory :organization do
    name { "MyString" }
  end
end
