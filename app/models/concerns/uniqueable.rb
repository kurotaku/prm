# frozen_string_literal: true

require "ulid"

module Uniqueable
  extend ActiveSupport::Concern
  included do
    before_create :ulid
  end

  def ulid
    self.uid = ULID.generate if uid.blank?
  end
end
