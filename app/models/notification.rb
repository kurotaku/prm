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
class Notification < ApplicationRecord
  include Uniqueable
  belongs_to :company, optional: true
  belongs_to :related_user, class_name: "User", optional: true
  has_many :notification_reads, dependent: :destroy
  has_many :read_users, through: :notification_reads, source: :user

  enum notification_type: {
    activity:          10,
    management_notice: 20,
  }

  enum viewable_permission: {
    to_admin_member:  10,
    to_normal_member: 20,
    to_all_member:    30,
  }

  # ユーザーのログインモードに応じて表示を切り替えるためのカラム.
  # User.login_mode == partner のとき、
  # User に紐づく Notificationsのうち login_mode == partner のものが取得される
  enum login_mode: {
    partner:     10,
    vendor:      20,
    all_company: 30,
  }

  enum link_type: {
    lead_show: 10,
  }

  validates :notification_type,
            :viewable_permission,
            :login_mode,
            :link_type,
            :published_at,
            :title,
            presence: true

  validates :company_id, presence: true, if: :activity?

  with_options if: :management_notice? do
    validates :message,
              presence: true
  end

  scope :left_join_notification_reads, lambda { |user_id|
    joins("
      LEFT OUTER JOIN
        (
          SELECT DISTINCT
            *
          FROM `notification_reads`
        ) as user_reads
      ON user_reads.`notification_id` = `notifications`.`id` AND user_reads.`user_id` = #{user_id}
    ")
  }
  scope :select_with_read_flag, lambda { |_user_id|
    select("
      notifications.*,
      CASE
      WHEN
        user_reads.notification_id is NULL THEN NULL
      ELSE true END AS already_read
    ")
  }
  scope :unread, lambda {
    where(user_reads: { id: nil })
  }

  def read!(user)
    raise ArgumentError, "the user can not access this notification." unless check_authority(user)

    notification_reads.create!(user: user)
  end

  def read?(user)
    raise ArgumentError, "the user can not access this notification." unless check_authority(user)

    notification_reads.where(user_id: user.id).present?
  end

  def check_authority(user)
    if management_notice?
      company_id.nil? || company_id == user.company.id
    elsif activity?
      company_id == user.company.id
    else
      raise ArgumentError, "undefined `notification_type`"
    end
  end

  def reads_count
    read_users.size
  end

  def related_object
    case link_type.to_sym
    when :lead_show
      Lead.find_by(uuid: related_object_uuid)
    end
  end
end
