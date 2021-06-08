# frozen_string_literal: true

class OrganizationDecorator < ApplicationDecorator
  include ActionView::Helpers::AssetUrlHelper
  delegate_all

  def thumbnail
    image? ? image.thumb.url : helpers.asset_path("company_default.png")
  end
end
