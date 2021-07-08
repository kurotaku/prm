# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  account_type           :integer          default("normal"), not null
#  confirmation_sent_at   :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string(255)
#  deleted_at             :datetime
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  image                  :string(255)
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string(255)
#  name                   :string(255)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  role                   :integer          default("level_one"), not null
#  sign_in_count          :integer          default(0), not null
#  uid                    :string(255)
#  unconfirmed_email      :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  organization_id        :bigint           not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_organization_id       (organization_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (organization_id => organizations.id)
#
class User < ApplicationRecord
  include Uniqueable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable
  belongs_to :organization
  has_many :staffs

  # after_create :create_user_profile

  enum role: {
    level_one:   10,
    level_two:   20,
    level_three: 30,
    level_four:  40,
    level_five:  50,
  }

  enum account_type: {
    normal: 10,
    demo:   20,
    admin:  30,
  }

  mount_uploader :image, ImageUploader

  # def create_user_profile
  #   return if @current_vendor_group.blank?
  #   return if vendor_group_user_infos.where(vendor_group_id: @current_vendor_group.id).any?
  #   user_info = @current_vendor_group.user_infos.create!(Organization_id: Organization_id, name: name)
  # end
end
