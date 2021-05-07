# frozen_string_literal: true

class VendorGroupDecorator < ApplicationDecorator
  delegate_all

  def display_name
    object.maker_group.maker.name + "\u306E\u5546\u54C1\u3092\u8CA9\u58F2\u3092\u8CA9\u58F2\u3059\u308B\u305F\u3081\u306E\u30B0\u30EB\u30FC\u30D7"
  end
end
