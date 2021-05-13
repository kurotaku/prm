# == Schema Information
#
# Table name: download_file_histories
#
#  id             :bigint           not null, primary key
#  uid            :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  shared_file_id :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_download_file_histories_on_shared_file_id  (shared_file_id)
#  index_download_file_histories_on_user_id         (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (shared_file_id => shared_files.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :download_file_history do
    user { nil }
    shared_file { nil }
    uid { "MyString" }
  end
end
