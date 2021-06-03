# frozen_string_literal: true

# == Schema Information
#
# Table name: partners
#
#  id              :bigint           not null, primary key
#  address         :string(255)
#  deleted_at      :datetime
#  hierarchy       :integer          default("hierarchy_one")
#  maker_memo      :text(65535)
#  name            :string(255)
#  status          :integer          default(10), not null
#  uid             :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  company_id      :bigint
#  parent_id       :bigint
#  vendor_group_id :bigint           not null
#
# Indexes
#
#  index_partners_on_company_id       (company_id)
#  index_partners_on_parent_id        (parent_id)
#  index_partners_on_vendor_group_id  (vendor_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (parent_id => partners.id)
#  fk_rails_...  (vendor_group_id => vendor_groups.id)
#
class Partner < ApplicationRecord
  include Uniqueable

  belongs_to :vendor_group
  belongs_to :company, optional: true
  belongs_to :parent, class_name: "Partner", optional: true

  has_many :vendor_group_user_infos

  enum hierarchy: {
    hierarchy_one:   1,
    hierarchy_two:   2,
    hierarchy_three: 3,
    hierarchy_four:  4,
    hierarchy_five:  5,
  }
end
