# frozen_string_literal: true

# == Schema Information
#
# Table name: maker_group_user_infos
#
#  id             :bigint           not null, primary key
#  deleted_at     :datetime
#  email          :string(255)
#  name           :string(255)
#  phone          :string(255)
#  status         :integer          default(10), not null
#  uid            :string(255)
#  unique_key     :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  company_id     :bigint
#  maker_group_id :bigint           not null
#  partner_id     :bigint
#  user_id        :bigint
#
# Indexes
#
#  index_maker_group_user_infos_on_company_id      (company_id)
#  index_maker_group_user_infos_on_maker_group_id  (maker_group_id)
#  index_maker_group_user_infos_on_partner_id      (partner_id)
#  index_maker_group_user_infos_on_user_id         (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (maker_group_id => maker_groups.id)
#  fk_rails_...  (partner_id => partners.id)
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe MakerGroupUserInfo, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
