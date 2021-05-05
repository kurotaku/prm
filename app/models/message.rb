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
class Message < ApplicationRecord
  include Uniqueable
  
  belongs_to :board
  belongs_to :user
end
