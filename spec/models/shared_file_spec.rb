# == Schema Information
#
# Table name: shared_files
#
#  id             :bigint           not null, primary key
#  file           :string(255)
#  file_name      :string(255)
#  file_size      :integer
#  human_size     :string(255)
#  name           :string(255)
#  uid            :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  maker_group_id :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_shared_files_on_maker_group_id  (maker_group_id)
#  index_shared_files_on_user_id         (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (maker_group_id => maker_groups.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe SharedFile, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
