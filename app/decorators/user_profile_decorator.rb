# frozen_string_literal: true

class UserProfileDecorator < ApplicationDecorator
  delegate_all

  def has_account
    object.account? ? "\u958B\u8A2D\u6E08\u307F" : "\u672A\u958B\u8A2D"
  end
end
