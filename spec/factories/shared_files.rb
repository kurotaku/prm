# frozen_string_literal: true

# == Schema Information
#
# Table name: shared_files
#
#  id              :bigint           not null, primary key
#  file            :string(255)
#  file_name       :string(255)
#  file_size       :integer
#  human_size      :string(255)
#  name            :string(255)
#  uid             :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :bigint           not null
#  vendor_group_id :bigint           not null
#
# Indexes
#
#  index_shared_files_on_user_id          (user_id)
#  index_shared_files_on_vendor_group_id  (vendor_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (vendor_group_id => vendor_groups.id)
#
FactoryBot.define do
  factory :shared_file do
    file { "MyString" }
    file_name { "MyString" }
  end
end
