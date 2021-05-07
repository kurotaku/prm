# frozen_string_literal: true

# == Schema Information
#
# Table name: prefectures
#
#  id         :bigint           not null, primary key
#  code       :string(255)
#  name       :string(255)
#  status     :integer          default(10), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Prefecture < ApplicationRecord
end
