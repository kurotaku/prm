# frozen_string_literal: true

class ProductDecorator < ApplicationDecorator
  include ActionView::Helpers::AssetUrlHelper
  delegate_all

  def thumbnail
    image? ? image.thumb.url : helpers.asset_path("no_image.png")
  end
end
