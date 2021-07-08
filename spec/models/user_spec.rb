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
require "rails_helper"

RSpec.describe User, type: :model do
  describe '読み込みモジュールについて' do
    subject { described_class }
    it { is_expected.to include Uniqueable }
  end

  describe 'deviseのモジュールについて' do
    subject { described_class.devise_modules }
    it { is_expected.to include(:database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable, :trackable) }
  end

  describe '関連モデルについて' do
    it { expect(described_class.reflect_on_association(:organization).macro).to eq(:belongs_to) }
    it { expect(described_class.reflect_on_association(:staffs).macro).to eq(:has_many) }
  end

  describe 'enums' do
    describe '#role' do
      it '正しく値が設定されていること' do
        expect(described_class.roles.symbolize_keys).to eq(level_one:   10,
                                                           level_two:   20,
                                                           level_three: 30,
                                                           level_four:  40,
                                                           level_five:  50,)
      end
    end

    describe '#account_type' do
      it '正しく値が設定されていること' do
        expect(described_class.account_types.symbolize_keys).to eq(normal: 10,
                                                                   demo:   20,
                                                                   admin:  30,)
      end
    end
  end
end
