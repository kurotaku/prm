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
class SharedFile < ApplicationRecord
end
