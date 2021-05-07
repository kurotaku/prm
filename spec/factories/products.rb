# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id             :bigint           not null, primary key
#  code           :string(255)
#  deleted_at     :datetime
#  description    :text(65535)
#  incentive      :integer
#  name           :string(255)
#  price          :integer
#  status         :integer          default(10), not null
#  uid            :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  maker_group_id :bigint           not null
#
# Indexes
#
#  index_products_on_maker_group_id  (maker_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (maker_group_id => maker_groups.id)
#
FactoryBot.define do
  factory :product do
    maker_group { nil }
  end
end
