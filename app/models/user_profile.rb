# frozen_string_literal: true

# == Schema Information
#
# Table name: user_profiles
#
#  id         :bigint           not null, primary key
#  code       :string(255)
#  email      :string(255)
#  name       :string(255)
#  phone      :string(255)
#  status     :integer          default(10), not null
#  uid        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint           not null
#  user_id    :bigint
#
# Indexes
#
#  index_user_profiles_on_company_id  (company_id)
#  index_user_profiles_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (user_id => users.id)
#
class UserProfile < ApplicationRecord
  include Uniqueable

  belongs_to :company
  belongs_to :user, optional: true

  before_update :update_user_name

  def account?
    !user.blank?
  end

  private

  def update_user_name
    return if user_id.nil?
    self.user.name = self.name if self.user.name != self.name
    self.user.save!
  end
end
