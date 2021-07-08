# frozen_string_literal: true

# Notificationのパラメータ生成メソッド
class GenerateNotificationParamService
  class << self
    ###### 案件成約時（ベンダー） ######
    def create_notification_for_vendor(lead, user)
      title = I18n.t("notifications.notifications_for_vendor.notify_title", name: user.name, lead_unique_key: lead.unique_key)
      {
        related_user:        user,
        title:               title,
        notification_type:   :activity,
        viewable_permission: :to_all_member,
        login_mode:          :partner,
        link_type:           :lead_show,
        company_id:          lead.company_id,
        related_object_uid:  lead.uid,
        published_at:        Time.current,
        description:         I18n.t("notifications.notifications_for_vendor.notify_description", lead_unique_key: lead.unique_key),
      }
    end
  end
end
