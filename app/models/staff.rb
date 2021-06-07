# == Schema Information
#
# Table name: staffs
#
#  id              :bigint           not null, primary key
#  deleted_at      :datetime
#  email           :string(255)
#  name            :string(255)
#  phone           :string(255)
#  status          :integer          default(10), not null
#  uid             :string(255)
#  unique_key      :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  company_id      :bigint
#  user_id         :bigint
#  vendor_group_id :bigint           not null
#
# Indexes
#
#  index_staffs_on_company_id       (company_id)
#  index_staffs_on_user_id          (user_id)
#  index_staffs_on_vendor_group_id  (vendor_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (vendor_group_id => vendor_groups.id)
#
class Staff < ApplicationRecord
  include Uniqueable
  
  belongs_to :vendor_group
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
