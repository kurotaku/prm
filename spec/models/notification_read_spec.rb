# frozen_string_literal: true

# == Schema Information
#
# Table name: notification_reads
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  notification_id :bigint           not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_notification_reads_on_notification_id  (notification_id)
#  index_notification_reads_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (notification_id => notifications.id)
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe NotificationRead, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
