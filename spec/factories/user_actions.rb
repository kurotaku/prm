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
FactoryBot.define do
  factory :user_action do
    ctrl_path { "MyString" }
    act_path { "MyString" }
    name { "MyString" }
  end
end
