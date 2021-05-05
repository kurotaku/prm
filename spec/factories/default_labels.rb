# == Schema Information
#
# Table name: default_labels
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  order      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :default_label do
    order { 1 }
    name { 'MyString' }
  end
end
