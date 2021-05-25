# frozen_string_literal: true

class UserDecorator < ApplicationDecorator
  delegate_all

  def thumbnail
    image? ? image.thumb.url : helpers.asset_path("user_default.png")
  end
end
