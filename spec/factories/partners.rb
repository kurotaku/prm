# frozen_string_literal: true

# == Schema Information
#
# Table name: partners
#
#  id             :bigint           not null, primary key
#  deleted_at     :datetime
#  hierarchy      :integer
#  maker_memo     :text(65535)
#  status         :integer          default(10), not null
#  uid            :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  company_id     :bigint           not null
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
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (maker_group_id => maker_groups.id)
#  fk_rails_...  (parent_id => companies.id)
#
FactoryBot.define do
  factory :partner do
    maker_group { nil }
    company { nil }
    hierarchy { 1 }
    parent { nil }
  end
end
