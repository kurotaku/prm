# == Schema Information
#
# Table name: shared_files
#
#  id         :bigint           not null, primary key
#  file       :string(255)
#  file_name  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe SharedFile, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
