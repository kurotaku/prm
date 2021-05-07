# frozen_string_literal: true

# == Schema Information
#
# Table name: boards
#
#  id                 :bigint           not null, primary key
#  related_object     :string(255)
#  related_object_uid :string(255)
#  status             :integer          default(10), not null
#  uid                :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
require "rails_helper"

RSpec.describe Board, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
