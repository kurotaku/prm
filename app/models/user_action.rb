# frozen_string_literal: true

# == Schema Information
#
# Table name: user_actions
#
#  id         :bigint           not null, primary key
#  act_path   :string(255)
#  ctrl_path  :string(255)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserAction < ApplicationRecord
  has_many :user_action_permissions

  validates :ctrl_path, uniqueness: { scope: :act_path, message: "\u91CD\u8907\u3057\u3066\u3044\u307E\u3059" }
end
