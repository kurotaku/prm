# frozen_string_literal: true

# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  content    :text(65535)
#  uid        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint           not null
#  staff_id   :bigint           not null
#
# Indexes
#
#  index_messages_on_board_id  (board_id)
#  index_messages_on_staff_id  (staff_id)
#
# Foreign Keys
#
#  fk_rails_...  (board_id => boards.id)
#  fk_rails_...  (staff_id => staffs.id)
#
class MessageSerializer < ActiveModel::Serializer
  attributes :uid, :content, :create_datetime, :staff_name, :staff_thumbnail

  def create_datetime
    object.created_at.strftime("%Y/%m/%d/ %H:%M")
  end

  def staff_name
    object.staff.name
  end

  def staff_thumbnail
    object.staff.decorate.thumbnail
  end
end
