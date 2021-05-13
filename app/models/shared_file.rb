# == Schema Information
#
# Table name: shared_files
#
#  id             :bigint           not null, primary key
#  file           :string(255)
#  file_name      :string(255)
#  file_size      :integer
#  human_size     :string(255)
#  title          :string(255)
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
class SharedFile < ApplicationRecord
  include Uniqueable
  mount_uploader :file, FileUploader
  
  belongs_to :user
  belongs_to :maker_group

  has_many :download_file_histories
  
  delegate :uid, to: :maker_group, prefix: :maker_group
end
