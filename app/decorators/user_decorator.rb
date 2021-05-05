class UserDecorator < ApplicationDecorator
  include ActionView::Helpers::AssetUrlHelper
  delegate_all

  def thumbnail
    image? ? image.thumb.url : helpers.asset_path('user_default.png')
  end
end
