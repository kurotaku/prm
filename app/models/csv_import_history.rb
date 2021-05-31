# == Schema Information
#
# Table name: csv_import_histories
#
#  id             :bigint           not null, primary key
#  cache          :text(65535)
#  file_name      :string(255)
#  related_object :integer          default("partner"), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  maker_group_id :bigint           not null
#
# Indexes
#
#  index_csv_import_histories_on_maker_group_id  (maker_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (maker_group_id => maker_groups.id)
#
class CsvImportHistory < ApplicationRecord
  belongs_to :maker_group

  enum related_object: {
    partner:               10,
    maker_group_user_info: 20,
    product:               30,
    lead:                  40,
  }
end
