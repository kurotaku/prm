# == Schema Information
#
# Table name: agents
#
#  id              :bigint           not null, primary key
#  deleted_at      :datetime
#  hierarchy       :integer
#  status          :integer          default(10), not null
#  uuid            :string(255)
#  vendor_memo     :text(65535)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  company_id      :bigint           not null
#  maker_group_id  :bigint           not null
#  parent_id       :bigint
#  vendor_group_id :bigint           not null
#
# Indexes
#
#  index_agents_on_company_id       (company_id)
#  index_agents_on_maker_group_id   (maker_group_id)
#  index_agents_on_parent_id        (parent_id)
#  index_agents_on_vendor_group_id  (vendor_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (maker_group_id => maker_groups.id)
#  fk_rails_...  (parent_id => companies.id)
#  fk_rails_...  (vendor_group_id => vendor_groups.id)
#
class Agent < ApplicationRecord
  belongs_to :maker_group
  belongs_to :vendor_group
  belongs_to :company
  belongs_to :parent, class_name: 'Company', optional: true

  has_many :agent_products

  def display_hierarchy
    hierarchy.to_s + '次店'
  end
end
