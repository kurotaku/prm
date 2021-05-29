# frozen_string_literal: true

class CompanyDecorator < ApplicationDecorator
  include ActionView::Helpers::AssetUrlHelper
  delegate_all

  def thumbnail
    image? ? image.thumb.url : helpers.asset_path("company_default.png")
  end
end
