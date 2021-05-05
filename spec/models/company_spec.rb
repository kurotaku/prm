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
require 'rails_helper'

RSpec.describe Company, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
