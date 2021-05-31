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
FactoryBot.define do
  factory :csv_import_history do
    maker_group { nil }
    related_object { 1 }
    file_name { "MyString" }
    cache { "MyText" }
  end
end
