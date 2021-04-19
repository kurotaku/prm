# == Schema Information
#
# Table name: maker_informations
#
#  id             :bigint           not null, primary key
#  content        :text(65535)
#  title          :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  maker_group_id :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_maker_informations_on_maker_group_id  (maker_group_id)
#  index_maker_informations_on_user_id         (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (maker_group_id => maker_groups.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :maker_information do
    maker_group { nil }
    title { "MyString" }
    content { "MyText" }
    user { nil }
  end
end
