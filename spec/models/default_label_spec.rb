# == Schema Information
#
# Table name: default_labels
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  order      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe DefaultLabel, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
