# frozen_string_literal: true

# == Schema Information
#
# Table name: notifications
#
#  id                  :bigint           not null, primary key
#  description         :text(65535)
#  link_type           :integer          not null
#  login_mode          :integer          not null
#  message             :text(65535)
#  notification_type   :integer          not null
#  published_at        :datetime         not null
#  related_object_uid  :string(255)
#  title               :string(255)      not null
#  uid                 :string(255)      not null
#  viewable_permission :integer          not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  company_id          :bigint
#  related_user_id     :bigint
#
# Indexes
#
#  index_notifications_on_company_id          (company_id)
#  index_notifications_on_related_object_uid  (related_object_uid)
#  index_notifications_on_related_user_id     (related_user_id)
#  index_notifications_on_uid                 (uid) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (related_user_id => users.id)
#
require "rails_helper"

RSpec.describe Notification, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
