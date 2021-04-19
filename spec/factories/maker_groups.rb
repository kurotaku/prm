# == Schema Information
#
# Table name: maker_groups
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  status     :integer          default(10), not null
#  uuid       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  maker_id   :bigint           not null
#
# Indexes
#
#  index_maker_groups_on_maker_id  (maker_id)
#
# Foreign Keys
#
#  fk_rails_...  (maker_id => companies.id)
#
FactoryBot.define do
  factory :maker_group do
    maker { nil }
  end
end
