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
class UserActionPermission < ApplicationRecord
  belongs_to :company
  belongs_to :user_action

  validates :company_id, uniqueness: { scope: :user_action_id, message: "\u91CD\u8907\u3057\u3066\u3044\u307E\u3059" }

  enum permit_role: {
    level_one:   10,
    level_two:   20,
    level_three: 30,
    level_four:  40,
    level_five:  50,
  }
end
