class VendorGroupDecorator < ApplicationDecorator
  delegate_all

  def display_name
    object.maker_group.maker.name + 'の商品を販売を販売するためのグループ'
  end
end
