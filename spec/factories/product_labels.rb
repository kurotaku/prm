# frozen_string_literal: true

# == Schema Information
#
# Table name: product_labels
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  order      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint           not null
#
# Indexes
#
#  index_product_labels_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#
FactoryBot.define do
  factory :product_label do
    product { nil }
    order { 1 }
    name { "MyString" }
  end
end
