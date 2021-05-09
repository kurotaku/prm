# frozen_string_literal: true

# == Schema Information
#
# Table name: user_profiles
#
#  id         :bigint           not null, primary key
#  email      :string(255)
#  name       :string(255)
#  phone      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_user_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class UserProfile < ApplicationRecord
  belongs_to :user, optional: true

  after_save :store_user_name

  private

  def store_user_name
    return if user_id.nil?
    self.user.name = self.name
    self.user.save!
  end
end
