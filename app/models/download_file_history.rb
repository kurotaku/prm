# frozen_string_literal: true

# == Schema Information
#
# Table name: download_file_histories
#
#  id             :bigint           not null, primary key
#  uid            :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  shared_file_id :bigint           not null
#  staff_id       :bigint           not null
#
# Indexes
#
#  index_download_file_histories_on_shared_file_id  (shared_file_id)
#  index_download_file_histories_on_staff_id        (staff_id)
#
# Foreign Keys
#
#  fk_rails_...  (shared_file_id => shared_files.id)
#  fk_rails_...  (staff_id => staffs.id)
#
class DownloadFileHistory < ApplicationRecord
  include Uniqueable

  belongs_to :staff
  belongs_to :shared_file
end
