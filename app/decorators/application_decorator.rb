# frozen_string_literal: true

class ApplicationDecorator < Draper::Decorator
  include ActionView::Helpers::AssetUrlHelper

  def display_name
    object.name.present? ? object.name : "(\u540D\u79F0\u672A\u8A2D\u5B9A)"
  end
end
