# frozen_string_literal: true

# == Schema Information
#
# Table name: partners
#
#  id             :bigint           not null, primary key
#  address        :string(255)
#  deleted_at     :datetime
#  hierarchy      :integer          default("hierarchy_one")
#  maker_memo     :text(65535)
#  name           :string(255)
#  status         :integer          default(10), not null
#  uid            :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  company_id     :bigint
#  maker_group_id :bigint           not null
#  parent_id      :bigint
#
# Indexes
#
#  index_partners_on_company_id      (company_id)
#  index_partners_on_maker_group_id  (maker_group_id)
#  index_partners_on_parent_id       (parent_id)
#
# Foreign Keys
#
#  fk_rails_...  (maker_group_id => maker_groups.id)
#  fk_rails_...  (parent_id => partners.id)
#
FactoryBot.define do
  factory :partner do
    maker_group { nil }
    company { nil }
    hierarchy { 1 }
    parent { nil }
  end
end
