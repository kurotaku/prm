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
#  staff_id        :bigint           not null
#  vendor_group_id :bigint           not null
#
# Indexes
#
#  index_shared_files_on_staff_id         (staff_id)
#  index_shared_files_on_vendor_group_id  (vendor_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (staff_id => staffs.id)
#  fk_rails_...  (vendor_group_id => vendor_groups.id)
#
class SharedFile < ApplicationRecord
  include Uniqueable
  mount_uploader :file, FileUploader

  belongs_to :staff, optional: true
  belongs_to :vendor_group

  has_many :download_file_histories

  delegate :uid, to: :vendor_group, prefix: :vendor_group
end
