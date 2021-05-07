# frozen_string_literal: true

# == Schema Information
#
# Table name: user_action_permissions
#
#  id             :bigint           not null, primary key
#  permit_role    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  company_id     :bigint           not null
#  user_action_id :bigint           not null
#
# Indexes
#
#  index_user_action_permissions_on_company_id      (company_id)
#  index_user_action_permissions_on_user_action_id  (user_action_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (user_action_id => user_actions.id)
#
FactoryBot.define do
  factory :user_action_permission do
    company { nil }
    user_action { nil }
    role_level { 1 }
  end
end
