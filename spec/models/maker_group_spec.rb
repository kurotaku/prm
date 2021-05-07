# frozen_string_literal: true

# == Schema Information
#
# Table name: maker_groups
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  status     :integer          default(10), not null
#  uid        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  maker_id   :bigint           not null
#
# Indexes
#
#  index_maker_groups_on_maker_id  (maker_id)
#
# Foreign Keys
#
#  fk_rails_...  (maker_id => companies.id)
#
require "rails_helper"

RSpec.describe MakerGroup, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
