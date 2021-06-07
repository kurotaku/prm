class StaffDecorator < ApplicationDecorator
  delegate_all

  def has_account
    object.account? ? "\u958B\u8A2D\u6E08\u307F" : "\u672A\u958B\u8A2D"
  end

  def thumbnail
    object.user.present? ? user.decorate.thumbnail : helpers.asset_path("user_default.png")
  end

end
