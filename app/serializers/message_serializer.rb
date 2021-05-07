# frozen_string_literal: true

# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  content    :text(65535)
#  status     :integer          default(10), not null
#  uid        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_messages_on_board_id  (board_id)
#  index_messages_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (board_id => boards.id)
#  fk_rails_...  (user_id => users.id)
#
class MessageSerializer < ActiveModel::Serializer
  attributes :uid, :content, :create_datetime, :user_name, :user_thumbnail

  def create_datetime
    object.created_at.strftime("%Y/%m/%d/ %H:%M")
  end

  def user_name
    object.user.user_profile.name
  end

  def user_thumbnail
    object.user.decorate.thumbnail
  end
end
