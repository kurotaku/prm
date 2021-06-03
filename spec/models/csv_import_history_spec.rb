# == Schema Information
#
# Table name: csv_import_histories
#
#  id              :bigint           not null, primary key
#  cache           :text(65535)
#  file_name       :string(255)
#  related_object  :integer          default("partner"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  vendor_group_id :bigint           not null
#
# Indexes
#
#  index_csv_import_histories_on_vendor_group_id  (vendor_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (vendor_group_id => vendor_groups.id)
#
require "rails_helper"

RSpec.describe CsvImportHistory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
