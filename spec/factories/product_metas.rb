# == Schema Information
#
# Table name: product_metas
#
#  id         :bigint           not null, primary key
#  meta_key   :string(255)
#  meta_label :string(255)
#  meta_type  :string(255)
#  order      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint           not null
#
# Indexes
#
#  index_product_metas_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#
FactoryBot.define do
  factory :product_meta do
    product { nil }
    meta_kay { 'MyString' }
    meta_type { 'MyString' }
    order { 1 }
  end
end
