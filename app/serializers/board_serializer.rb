# frozen_string_literal: true

# == Schema Information
#
# Table name: boards
#
#  id                 :bigint           not null, primary key
#  related_object     :string(255)
#  related_object_uid :string(255)
#  status             :integer          default(10), not null
#  uid                :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class BoardSerializer < ActiveModel::Serializer
  attributes :uid
  has_many :messages, serializer: MessageSerializer
end
