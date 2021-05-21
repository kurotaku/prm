# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id                       :bigint           not null, primary key
#  agency_description       :text(65535)
#  agency_incentive         :integer
#  agency_price             :integer
#  code                     :string(255)
#  deleted_at               :datetime
#  image                    :string(255)
#  introduction_description :text(65535)
#  introduction_incentive   :integer
#  introduction_price       :integer
#  name                     :string(255)
#  status                   :integer          default(10), not null
#  uid                      :string(255)
#  wholesale_description    :text(65535)
#  wholesale_incentive      :integer
#  wholesale_price          :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  maker_group_id           :bigint           not null
#
# Indexes
#
#  index_products_on_maker_group_id  (maker_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (maker_group_id => maker_groups.id)
#
require "rails_helper"

RSpec.describe Product, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
